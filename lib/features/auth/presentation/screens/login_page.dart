import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../shared/ui_utils/l10n_extension.dart';
import '../../../../shared/ui_kit/app_colors.dart';
import '../../../../shared/ui_kit/auth_text_field.dart';
import '../controllers/auth_cubit.dart';
import '../controllers/auth_error_l10n.dart';
import '../controllers/auth_view_model.dart';
import '../widgets/auth_widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  void _submit(BuildContext context, AuthViewModel state) {
    if (state.isLoading) return;
    if (!_formKey.currentState!.validate()) return;
    context.read<AuthCubit>().signInWithEmail(
          email: _emailCtrl.text.trim(),
          password: _passwordCtrl.text,
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthViewModel>(
      listener: (context, state) {
        if (state.isAuthenticated) {
          context.go('/dashboard');
        }
        if (state.error != null && state.error!.isNotEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(context.l10n.translateAuthError(state.error!)),
              backgroundColor: AppColors.error,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        final l10n = context.l10n;
        return Scaffold(
          backgroundColor: AppColors.pageBackground,
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 60),
                    const AuthHeader(),
                    const SizedBox(height: 40),
                    Text(
                      l10n.loginTitle,
                      style: GoogleFonts.manrope(
                        fontWeight: FontWeight.w700,
                        fontSize: 28,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      l10n.loginSubtitle,
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        color: AppColors.textSecondary,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 32),
                    AuthTextField(
                      controller: _emailCtrl,
                      label: l10n.labelEmail,
                      hint: l10n.hintEmail,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      validator: (v) {
                        if (v == null || v.trim().isEmpty) {
                          return l10n.validationEmailRequired;
                        }
                        if (!v.contains('@')) return l10n.validationEmailInvalid;
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    AuthTextField(
                      controller: _passwordCtrl,
                      label: l10n.labelPassword,
                      hint: '••••••••',
                      isPassword: true,
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (_) => _submit(context, state),
                      validator: (v) {
                        if (v == null || v.isEmpty) {
                          return l10n.validationPasswordRequired;
                        }
                        return null;
                      },
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () => context.push('/forgot-password'),
                        style: TextButton.styleFrom(
                          foregroundColor: AppColors.splashBg,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 4,
                            vertical: 8,
                          ),
                        ),
                        child: Text(
                          l10n.loginForgotPassword,
                          style: GoogleFonts.inter(fontSize: 14),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    AuthPrimaryButton(
                      label: l10n.loginButton,
                      isLoading: state.isLoading,
                      onPressed: () => _submit(context, state),
                    ),
                    const SizedBox(height: 28),
                    const AuthOrDivider(),
                    const SizedBox(height: 28),
                    AuthGoogleButton(
                      isLoading: state.isLoading,
                      onPressed: () =>
                          context.read<AuthCubit>().signInWithGoogle(),
                    ),
                    const SizedBox(height: 36),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            color: AppColors.textSecondary,
                          ),
                          children: [
                            TextSpan(text: l10n.loginNoAccount),
                            TextSpan(
                              text: l10n.loginSignUpLink,
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: AppColors.splashBg,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => context.push('/sign-up'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

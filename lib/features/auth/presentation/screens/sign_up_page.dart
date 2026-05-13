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

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameCtrl = TextEditingController();
  final _lastNameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _confirmPasswordCtrl = TextEditingController();

  @override
  void dispose() {
    _firstNameCtrl.dispose();
    _lastNameCtrl.dispose();
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    _confirmPasswordCtrl.dispose();
    super.dispose();
  }

  void _submit(BuildContext context, AuthViewModel state) {
    if (state.isLoading) return;
    if (!_formKey.currentState!.validate()) return;
    final displayName =
        '${_firstNameCtrl.text.trim()} ${_lastNameCtrl.text.trim()}'.trim();
    context.read<AuthCubit>().signUp(
          email: _emailCtrl.text.trim(),
          password: _passwordCtrl.text,
          displayName: displayName.isNotEmpty ? displayName : null,
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
                      l10n.signUpTitle,
                      style: GoogleFonts.manrope(
                        fontWeight: FontWeight.w700,
                        fontSize: 28,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      l10n.signUpSubtitle,
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        color: AppColors.textSecondary,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 32),
                    AuthTextField(
                      controller: _firstNameCtrl,
                      label: l10n.labelFirstName,
                      hint: l10n.hintFirstName,
                      textInputAction: TextInputAction.next,
                      validator: (v) {
                        if (v == null || v.trim().isEmpty) {
                          return l10n.validationFirstNameRequired;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    AuthTextField(
                      controller: _lastNameCtrl,
                      label: l10n.labelLastName,
                      hint: l10n.hintLastName,
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 16),
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
                      textInputAction: TextInputAction.next,
                      validator: (v) {
                        if (v == null || v.isEmpty) {
                          return l10n.validationPasswordRequired;
                        }
                        if (v.length < 8) {
                          return l10n.validationPasswordMinLength;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    AuthTextField(
                      controller: _confirmPasswordCtrl,
                      label: l10n.labelConfirmPassword,
                      hint: '••••••••',
                      isPassword: true,
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (_) => _submit(context, state),
                      validator: (v) {
                        if (v != _passwordCtrl.text) {
                          return l10n.validationPasswordsMismatch;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),
                    AuthPrimaryButton(
                      label: l10n.signUpButton,
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
                            TextSpan(text: l10n.signUpHasAccount),
                            TextSpan(
                              text: l10n.signUpSignInLink,
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: AppColors.splashBg,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => context.go('/login'),
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

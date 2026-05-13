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

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();

  @override
  void dispose() {
    _emailCtrl.dispose();
    super.dispose();
  }

  void _submit(BuildContext context, AuthViewModel state) {
    if (state.isLoading) return;
    if (!_formKey.currentState!.validate()) return;
    context.read<AuthCubit>().resetPassword(_emailCtrl.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthViewModel>(
      listener: (context, state) {
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
                    const SizedBox(height: 24),
                    GestureDetector(
                      onTap: () => context.pop(),
                      child: Text(
                        l10n.forgotPasswordBack,
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: AppColors.splashBg,
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    if (state.resetEmailSent) ...[
                      _SuccessState(email: _emailCtrl.text),
                    ] else ...[
                      Text(
                        l10n.forgotPasswordTitle,
                        style: GoogleFonts.manrope(
                          fontWeight: FontWeight.w700,
                          fontSize: 28,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        l10n.forgotPasswordSubtitle,
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
                        textInputAction: TextInputAction.done,
                        onFieldSubmitted: (_) => _submit(context, state),
                        validator: (v) {
                          if (v == null || v.trim().isEmpty) {
                            return l10n.validationEmailRequired;
                          }
                          if (!v.contains('@')) {
                            return l10n.validationEmailInvalid;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 24),
                      AuthPrimaryButton(
                        label: l10n.forgotPasswordButton,
                        isLoading: state.isLoading,
                        onPressed: () => _submit(context, state),
                      ),
                      const SizedBox(height: 32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Expanded(
                            child: Divider(
                              color: AppColors.borderLight,
                              thickness: 1,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              l10n.forgotPasswordTlsNote,
                              style: GoogleFonts.inter(
                                fontSize: 9,
                                color: AppColors.textPrimary
                                    .withValues(alpha: 0.4),
                                letterSpacing: 0.3,
                              ),
                            ),
                          ),
                          const Expanded(
                            child: Divider(
                              color: AppColors.borderLight,
                              thickness: 1,
                            ),
                          ),
                        ],
                      ),
                    ],
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

class _SuccessState extends StatelessWidget {
  const _SuccessState({required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final message = email.isNotEmpty
        ? l10n.forgotPasswordSuccessMessage(email)
        : l10n.forgotPasswordSuccessMessageNoEmail;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: const Color(0xFFDCFCE7),
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Icon(
            Icons.mark_email_read_outlined,
            color: Color(0xFF15803D),
            size: 32,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          l10n.forgotPasswordSuccessTitle,
          style: GoogleFonts.manrope(
            fontWeight: FontWeight.w700,
            fontSize: 28,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          message,
          style: GoogleFonts.inter(
            fontSize: 16,
            color: AppColors.textSecondary,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 32),
        GestureDetector(
          onTap: () => context.go('/login'),
          child: Container(
            height: 56,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.splashBg,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                l10n.forgotPasswordBackToLogin,
                style: GoogleFonts.manrope(
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

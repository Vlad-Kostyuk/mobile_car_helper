import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../shared/l10n/l10n_extension.dart';
import '../../../../shared/theme/app_colors.dart';
import '../../../auth/presentation/auth_cubit.dart';
import '../../../auth/presentation/model/auth_view_model.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _redirect();
  }

  Future<void> _redirect() async {
    final authCubit = context.read<AuthCubit>();

    // If auth state is still resolving, wait for it (max 5s) AND min splash time
    if (authCubit.state.status == AuthStatus.initial) {
      await Future.wait([
        authCubit.stream
            .firstWhere((s) => s.status != AuthStatus.initial)
            .timeout(
          const Duration(seconds: 5),
          onTimeout: () =>
              const AuthViewModel(status: AuthStatus.unauthenticated),
        ),
        Future.delayed(const Duration(milliseconds: 1500)),
      ]);
    } else {
      await Future.delayed(const Duration(milliseconds: 1500));
    }

    if (!mounted) return;

    if (authCubit.state.isAuthenticated) {
      context.go('/dashboard');
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    final hasSeenOnboarding = prefs.getBool('has_seen_onboarding') ?? false;
    if (!mounted) return;
    context.go(hasSeenOnboarding ? '/login' : '/onboarding');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashBg,
      body: Stack(
        children: [
          Positioned(
            right: -30,
            top: -80,
            child: _DecorCircle(size: 320),
          ),
          Positioned(
            left: -60,
            bottom: 160,
            child: _DecorCircle(size: 200),
          ),
          SafeArea(
            child: Column(
              children: [
                const Spacer(flex: 3),
                Container(
                  width: 96,
                  height: 96,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.directions_car_rounded,
                      color: Colors.white,
                      size: 52,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'CarHelper',
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w700,
                    fontSize: 36,
                    color: Colors.white,
                    letterSpacing: -1.5,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  context.l10n.splashTagline,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    color: Colors.white.withValues(alpha: 0.6),
                    height: 1.5,
                  ),
                ),
                const Spacer(flex: 2),
                const _DotsLoader(),
                const SizedBox(height: 32),
                Text(
                  'ВЕРСІЯ 2.4.0',
                  style: GoogleFonts.inter(
                    fontSize: 11,
                    color: Colors.white.withValues(alpha: 0.3),
                    letterSpacing: 0.6,
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DecorCircle extends StatelessWidget {
  const _DecorCircle({required this.size});
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withValues(alpha: 0.06),
      ),
    );
  }
}

class _DotsLoader extends StatefulWidget {
  const _DotsLoader();

  @override
  State<_DotsLoader> createState() => _DotsLoaderState();
}

class _DotsLoaderState extends State<_DotsLoader> with TickerProviderStateMixin {
  static const _delays = [0, 200, 400];
  late final List<AnimationController> _controllers;
  late final List<Animation<double>> _opacities;
  late final List<Animation<double>> _scales;
  late final List<Animation<double>> _translates;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(3, (_) {
      return AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 1200),
      );
    });

    _opacities = _controllers.map((c) {
      return Tween<double>(begin: 0.25, end: 1.0)
          .chain(CurveTween(curve: Curves.easeInOut))
          .animate(c);
    }).toList();

    _scales = _controllers.map((c) {
      return Tween<double>(begin: 0.7, end: 1.0)
          .chain(CurveTween(curve: Curves.easeInOut))
          .animate(c);
    }).toList();

    _translates = _controllers.map((c) {
      return Tween<double>(begin: 0.0, end: -5.0)
          .chain(CurveTween(curve: Curves.easeInOut))
          .animate(c);
    }).toList();

    for (int i = 0; i < 3; i++) {
      Future.delayed(Duration(milliseconds: _delays[i]), () {
        if (mounted) _controllers[i].repeat(reverse: true);
      });
    }
  }

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(3, (i) {
        return Padding(
          padding: EdgeInsets.only(right: i < 2 ? 16.0 : 0),
          child: AnimatedBuilder(
            animation: _controllers[i],
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, _translates[i].value),
                child: Transform.scale(
                  scale: _scales[i].value,
                  child: Opacity(
                    opacity: _opacities[i].value,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}

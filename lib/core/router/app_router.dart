import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/auth_cubit.dart';
import '../../features/auth/presentation/model/auth_view_model.dart';
import '../../features/auth/presentation/pages/forgot_password_page.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/sign_up_page.dart';
import '../../features/dashboard/presentation/pages/dashboard_page.dart';
import '../../features/onboarding/presentation/pages/onboarding_page.dart';
import '../../features/profile/presentation/pages/profile_page.dart';
import '../../features/profile/presentation/profile_cubit.dart';
import '../../features/settings/presentation/pages/settings_page.dart';
import '../../features/settings/presentation/settings_cubit.dart';
import '../../features/splash/presentation/pages/splash_page.dart';

GoRouter buildRouter(AuthCubit authCubit) => GoRouter(
      initialLocation: '/',
      refreshListenable: GoRouterRefreshStream(authCubit.stream),
      redirect: (context, state) {
        final status = authCubit.state.status;
        final loc = state.matchedLocation;

        // Auth state not yet resolved — keep on splash
        if (status == AuthStatus.initial) {
          return loc == '/' ? null : '/';
        }

        final isAuthenticated = status == AuthStatus.authenticated;
        const publicRoutes = {
          '/',
          '/onboarding',
          '/login',
          '/sign-up',
          '/forgot-password',
        };
        final isPublic = publicRoutes.contains(loc);

        // Unauthenticated user tries to access a protected route
        if (!isAuthenticated && !isPublic) return '/login';

        // Authenticated user on auth screens → send to dashboard
        if (isAuthenticated && (loc == '/login' || loc == '/sign-up')) {
          return '/dashboard';
        }

        return null;
      },
      routes: [
        GoRoute(path: '/', builder: (context, state) => const SplashPage()),
        GoRoute(path: '/onboarding', builder: (context, state) => const OnboardingPage()),
        GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
        GoRoute(path: '/sign-up', builder: (context, state) => const SignUpPage()),
        GoRoute(
          path: '/forgot-password',
          builder: (context, state) => const ForgotPasswordPage(),
        ),
        GoRoute(path: '/dashboard', builder: (context, state) => const DashboardPage()),
        GoRoute(
          path: '/profile',
          builder: (context, state) => BlocProvider.value(
            value: GetIt.I<ProfileCubit>(),
            child: const ProfilePage(),
          ),
        ),
        GoRoute(
          path: '/settings',
          builder: (context, state) => MultiBlocProvider(
            providers: [
              BlocProvider.value(value: GetIt.I<ProfileCubit>()),
              BlocProvider.value(value: GetIt.I<SettingsCubit>()),
            ],
            child: const SettingsPage(),
          ),
        ),
      ],
    );

/// Bridges a [Stream] to a [ChangeNotifier] so GoRouter can listen for
/// auth state changes and re-evaluate its redirect callback.
class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _sub = stream.listen((_) => notifyListeners());
  }

  late final StreamSubscription<dynamic> _sub;

  @override
  void dispose() {
    _sub.cancel();
    super.dispose();
  }
}

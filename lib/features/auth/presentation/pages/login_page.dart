import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/widgets/app_button.dart';
import '../../../../shared/widgets/app_loading_indicator.dart';
import '../auth_cubit.dart';
import '../model/auth_view_model.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Вхід')),
      body: BlocBuilder<AuthCubit, AuthViewModel>(
        builder: (context, vm) {
          if (vm.isLoading) return const AppLoadingIndicator();
          return Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (vm.error != null)
                  Text(vm.error!, style: const TextStyle(color: Colors.red)),
                AppButton(
                  label: 'Увійти з Google',
                  icon: Icons.login,
                  onPressed: () => context.read<AuthCubit>().signInWithGoogle(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

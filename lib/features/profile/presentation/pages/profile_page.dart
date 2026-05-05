import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../profile_cubit.dart';
import '../model/profile_view_model.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Профіль')),
      body: BlocBuilder<ProfileCubit, ProfileViewModel>(
        builder: (context, vm) => const Center(child: Text('TODO: profile UI')),
      ),
    );
  }
}

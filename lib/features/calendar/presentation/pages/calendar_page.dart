import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../calendar_cubit.dart';
import '../model/calendar_view_model.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Календар')),
      body: BlocBuilder<CalendarCubit, CalendarViewModel>(
        builder: (context, vm) => const Center(child: Text('TODO: calendar')),
      ),
    );
  }
}

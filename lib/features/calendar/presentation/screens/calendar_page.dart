import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/ui_utils/l10n_extension.dart';
import '../controllers/calendar_cubit.dart';
import '../controllers/calendar_view_model.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.calendarTitle)),
      body: BlocBuilder<CalendarCubit, CalendarViewModel>(
        builder: (context, vm) => const Center(child: Text('TODO: calendar')),
      ),
    );
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import './model/calendar_view_model.dart';

@injectable
class CalendarCubit extends Cubit<CalendarViewModel> {
  CalendarCubit() : super(CalendarViewModel(focusedDay: DateTime.now()));

  void selectDay(DateTime day) => emit(state.copyWith(selectedDay: day, focusedDay: day));
  void changeFocusedDay(DateTime day) => emit(state.copyWith(focusedDay: day));
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'calendar_view_model.freezed.dart';

@freezed
class CalendarViewModel with _$CalendarViewModel {
  const factory CalendarViewModel({
    @Default(false) bool isLoading,
    DateTime? focusedDay,
    DateTime? selectedDay,
    String? error,
  }) = _CalendarViewModel;
}

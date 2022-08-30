import 'package:meta/meta.dart';

@immutable
abstract class AttendanceHistoryEvent {}


class OnLoadingAttendanceHistoryList extends AttendanceHistoryEvent {
  String userid;
  OnLoadingAttendanceHistoryList({required this.userid});
}

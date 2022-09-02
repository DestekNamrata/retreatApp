import 'package:flutter_app/Models/model_paymentHistory.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AttendanceHistoryState {}

class InitialAttendanceHistoryState extends AttendanceHistoryState {}

class AttendanceHistoryListLoading extends AttendanceHistoryState {}


class AttendanceHistorySuccess extends AttendanceHistoryState {
  List<AttendanceHistoryModel>? attendenceHistoryList;
  AttendanceHistorySuccess({this.attendenceHistoryList});

}

class AttendanceHistoryFail extends AttendanceHistoryState {}

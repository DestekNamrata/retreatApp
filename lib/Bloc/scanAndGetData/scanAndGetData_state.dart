
import 'package:flutter_app/Models/model_attendance_det.dart';
import 'package:flutter_app/Models/model_login.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ScanAndGetDataState {}

class InitialScanState extends ScanAndGetDataState {}

class ScanDataLoading extends ScanAndGetDataState {}
class GetScanDataLoading extends ScanAndGetDataState {}


class ScanQrCodeSuccess extends ScanAndGetDataState {
 String? msg;
 ScanQrCodeSuccess({this.msg});

}

class GetAttendanceDataSuccess extends ScanAndGetDataState {
 Data? data;
 GetAttendanceDataSuccess({this.data});

}


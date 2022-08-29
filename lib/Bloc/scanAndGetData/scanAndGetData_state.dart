
import 'package:flutter_app/Models/model_login.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ScanAndGetDataState {}

class InitialScanState extends ScanAndGetDataState {}

class ScanDataLoading extends ScanAndGetDataState {}



class ScanQrCodeSuccess extends ScanAndGetDataState {


}


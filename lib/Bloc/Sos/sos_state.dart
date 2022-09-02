import 'package:meta/meta.dart';

@immutable
abstract class SOSState {}

class InitialSOSState extends SOSState {}
class SOSLoading extends SOSState {}



class GetsosSuccess extends SOSState {
 String? msg;
 GetsosSuccess({required this.msg});
}

class GetsosFail extends SOSState {}

import 'package:meta/meta.dart';


@immutable
abstract class SOSEvent {}


class GetSOS extends SOSEvent{
  String userId;


  GetSOS({required this.userId});
}

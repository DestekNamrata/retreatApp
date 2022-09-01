import 'package:meta/meta.dart';

@immutable
abstract class UnconferenceEvent {}


class GetAgendaList extends UnconferenceEvent {
  String eventType,userId,roomNo;
  GetAgendaList({required this.eventType,required this.userId,required this.roomNo});
}

class GetLivePollList extends UnconferenceEvent {
  String eventType,userId,roomNo;
  GetLivePollList({required this.eventType,required this.userId,required this.roomNo});
}


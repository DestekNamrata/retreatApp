import 'package:meta/meta.dart';

@immutable
abstract class AgendaEvent {}


class OnLoadingAgendaList extends AgendaEvent {
  String agendaDay;
  OnLoadingAgendaList({required this.agendaDay});
}

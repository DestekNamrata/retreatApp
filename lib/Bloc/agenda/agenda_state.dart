import 'package:meta/meta.dart';

import '../../Models/model_agenda.dart';

@immutable
abstract class AgendaState {}

class InitialAgendaState extends AgendaState {}

class AgendaListLoading extends AgendaState {}


class AgendaSuccess extends AgendaState {
  List<AgendaModel>? agendaList;
  AgendaSuccess({this.agendaList});

}

class AgendaFail extends AgendaState {}

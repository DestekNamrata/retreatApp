import 'package:flutter_app/Models/model_agenda_unconference.dart';
import 'package:flutter_app/Models/model_live_polls.dart';
import 'package:meta/meta.dart';

import '../../Models/model_agenda.dart';

@immutable
abstract class UnconferenceState {}

class InitialUnconferenceState extends UnconferenceState {}

class GetAgendaListLoading extends UnconferenceState {}
class GetLivePolllsListLoading extends UnconferenceState {}


class AgendaListSuccess extends UnconferenceState {
  List<UnConfAgendaData>? agendaList;
  String? punchIn;
  AgendaListSuccess({this.agendaList,this.punchIn});
}

class AgendaListFail extends UnconferenceState {}

class LivePollListSuccess extends UnconferenceState {
  List<LivePollsModel>? livePollList;
  LivePollListSuccess({this.livePollList});
}
class LivePollListFail extends UnconferenceState {}


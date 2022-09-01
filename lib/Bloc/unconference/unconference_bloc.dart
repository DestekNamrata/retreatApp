import 'package:flutter_app/Bloc/agenda/agenda_event.dart';
import 'package:flutter_app/Bloc/agenda/agenda_state.dart';
import 'package:flutter_app/Bloc/attendanceHistory/attendenceHistory_state.dart';
import 'package:flutter_app/Bloc/unconference/bloc.dart';
import 'package:flutter_app/Models/model_agenda.dart';
import 'package:flutter_app/Models/model_agenda_unconference.dart';
import 'package:flutter_app/Models/model_live_polls.dart';
import 'package:flutter_app/Utils/application.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Models/model_paymentHistory.dart';
import '../../Repository/UserRepository.dart';

class UnconferenceBloc extends Bloc<UnconferenceEvent, UnconferenceState> {
  UnconferenceBloc({this.unconferenceRepo}) : super(InitialUnconferenceState());
  final UserRepository? unconferenceRepo;


  @override
  Stream<UnconferenceState> mapEventToState(event) async* {

    ///Event for get agenda list
    if (event is GetAgendaList) {
      ///Notify loading to UI
      yield GetAgendaListLoading();

      ///Fetch API via repository
      final UnconferenceAgendaResp response = await unconferenceRepo!
          .fetchUnconfAgendaList(
       eventType: event.eventType,
        userId: Application.user!.id.toString()
      );

      final Iterable refactorAgendUnconf = response.data ?? [];
      final agendaUnconfList = refactorAgendUnconf.map((item) {
        return UnConfAgendaData.fromJson(item);
      }).toList();
      if(refactorAgendUnconf.length>0){
        yield AgendaListSuccess(
            agendaList: agendaUnconfList,
          punchIn: response.punchIn
        );
      }else{
        yield AgendaListFail();
      }
    }

    //to get live polls
    if(event is GetLivePollList){
      yield GetLivePolllsListLoading();

      final LivePollsResp response = await unconferenceRepo!
          .fetchLivePollList(
          eventType: event.eventType,
          roomNo: event.roomNo!,
          userId: Application.user!.id.toString()
      );

      final Iterable refactorlivePoll = response.data ?? [];
      final livePollList = refactorlivePoll.map((item) {
        return LivePollsModel.fromJson(item);
      }).toList();
      if(refactorlivePoll.length>0){
        yield LivePollListSuccess(
            livePollList: livePollList,
        );
      }else{
        yield LivePollListFail();
      }

    }

  }
}

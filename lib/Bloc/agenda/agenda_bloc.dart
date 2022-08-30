

import 'package:flutter_app/Bloc/agenda/agenda_event.dart';
import 'package:flutter_app/Bloc/agenda/agenda_state.dart';
import 'package:flutter_app/Bloc/attendanceHistory/attendenceHistory_state.dart';
import 'package:flutter_app/Models/model_agenda.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Models/model_paymentHistory.dart';
import '../../Repository/UserRepository.dart';

class AgendaBloc extends Bloc<AgendaEvent, AgendaState> {
  AgendaBloc({this.agendaRepo}) : super(InitialAgendaState());
  final UserRepository? agendaRepo;


  @override
  Stream<AgendaState> mapEventToState(event) async* {


    ///Event for AttendenceHistory
    if (event is OnLoadingAgendaList) {
      ///Notify loading to UI
      yield AgendaListLoading();

      ///Fetch API via repository
      final AgendaRepo response = await agendaRepo!
          .fetchAgendaList(
        agendaDay: event.agendaDay,
      );

      final Iterable refactorProduct = response.data ?? [];
      final agendaList = refactorProduct.map((item) {
        return AgendaModel.fromJson(item);
      }).toList();
      if(refactorProduct.length>0){
        yield AgendaSuccess(
            agendaList: agendaList
        );

      }else{
        yield AgendaFail();

      }


    }

  }



}

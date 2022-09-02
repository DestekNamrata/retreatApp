import 'package:flutter_app/Bloc/agenda/agenda_event.dart';
import 'package:flutter_app/Bloc/agenda/agenda_state.dart';
import 'package:flutter_app/Bloc/attendanceHistory/attendenceHistory_state.dart';
import 'package:flutter_app/Bloc/breather/bloc.dart';
import 'package:flutter_app/Bloc/unconference/bloc.dart';
import 'package:flutter_app/Models/model_agenda.dart';
import 'package:flutter_app/Models/model_agenda_unconference.dart';
import 'package:flutter_app/Models/model_live_polls.dart';
import 'package:flutter_app/Models/model_room_list.dart';
import 'package:flutter_app/Utils/application.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Models/model_paymentHistory.dart';
import '../../Repository/UserRepository.dart';

class BreathersBloc extends Bloc<BreatherEvent, BreatherState> {
  BreathersBloc({this.breatherRepo}) : super(InitialBreatherState());
  final UserRepository? breatherRepo;


  @override
  Stream<BreatherState> mapEventToState(event) async* {

    ///Event for get agenda list
    if (event is GetRoomList) {
      ///Notify loading to UI
      yield GetRoomListLoading();

      ///Fetch API via repository
      final RoomListResp response = await breatherRepo!
          .fetchRoomList();

      final Iterable refactorRoomList = response.data ?? [];
      final roomListData = refactorRoomList.map((item) {
        return RoomData.fromJson(item);
      }).toList();
      if(refactorRoomList.length>0){
        yield RoomListSuccess(
          roomList: roomListData

        );
      }else{
        yield RoomListFail();
      }
    }



  }
}

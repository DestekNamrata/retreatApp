import 'package:flutter_app/Models/model_agenda_unconference.dart';
import 'package:flutter_app/Models/model_live_polls.dart';
import 'package:flutter_app/Models/model_room_list.dart';
import 'package:meta/meta.dart';

import '../../Models/model_agenda.dart';

@immutable
abstract class BreatherState {}

class InitialBreatherState extends BreatherState {}

class GetRoomListLoading extends BreatherState {}


class RoomListSuccess extends BreatherState {
  List<RoomData>? roomList;
  RoomListSuccess({this.roomList});
}

class  RoomListFail extends BreatherState {}




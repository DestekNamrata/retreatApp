import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app/Api/api.dart';
import 'package:flutter_app/Models/model_login.dart';
import 'package:flutter_app/Utils/application.dart';
import 'package:flutter_app/Utils/preferences.dart';
import 'package:flutter_app/Utils/util_preferences.dart';


class UserRepository {

  ///Fetch api login
  Future<dynamic> login({String? mobile,String? password,}) async {
    final params = {"mobile":mobile,"password":password};
    return await Api.login(params);
  }

  //
  // ///Save Storage
  Future<dynamic> saveUser(User user) async {
    return await UtilPreferences.setString(
      Preferences.user,
      jsonEncode(user.toJson()),
    );
  }

  //Payment History
  Future<dynamic> fetchAttendanceHistory({String? userId}) async {
    final params = {"user_id":userId};
    return await Api.getAttendanceHistory(params);
  }

  Future<dynamic> fetchAgendaList({String? agendaDay}) async {
    final params = {"agenda_day":agendaDay};
    return await Api.getAgenta(params);
  }

  Future<dynamic> fetchUnconfAgendaList({String? eventType,String? userId,String? roomNo}) async {
    final params = {"event_type":eventType,"user_id":userId,"room_no":roomNo};
    return await Api.getAgendaUnconf(params);
  }

  Future<dynamic> fetchLivePollList({String? eventType,String? userId,String? roomNo}) async {
    final params = {"event_type":eventType,"user_id":userId,"room_no":roomNo};
    return await Api.getLivePoll(params);
  }

  Future<dynamic> fetchRoomList() async {
    return await Api.getRoomList();
  }
  dynamic getUser() {
    return UtilPreferences.getString(Preferences.user);
  }

  // ///Delete Storage
  Future<dynamic> deleteUser() async {
    return await UtilPreferences.remove(Preferences.user);
  }

  //get attendance data
  Future<dynamic> getAttendanceData({String? attendanceType,String? roomNo,}) async {
    final params = {"user_id":Application.user!.id.toString(),"attendance_type":attendanceType,"room_no":roomNo};
    return await Api.getAttendanceDeta(params);
  }

}


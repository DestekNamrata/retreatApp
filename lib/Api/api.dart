import 'dart:async';

import 'package:flutter_app/Models/model_agenda.dart';
import 'package:flutter_app/Models/model_agenda_unconference.dart';
import 'package:flutter_app/Models/model_attendance_det.dart';
import 'package:flutter_app/Models/model_live_polls.dart';
import 'package:flutter_app/Models/model_login.dart';
import 'package:flutter_app/Models/model_paymentHistory.dart';
import 'package:flutter_app/Models/model_room_list.dart';
import 'package:flutter_app/Utils/application.dart';
import 'package:flutter_app/Utils/util_preferences.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';


class Api {

  // static const String HOST_URL="https://13.235.176.176/api/";//updated on 23/12/2020
  static const String HOST_URL="http://infocepts.ezii.live/api/";//updated on 23/12/2020
  static const APIKEY="apikey=4b9d3423805c3c108cab8d7693426325b8f1ee07";
  static const signIn=HOST_URL+"login";
  static const SCAN_QR=HOST_URL+"attendance";
  static const GET_ATTENDANCE=HOST_URL+"get_attendance";
  static const GET_ATTENDANCE_HISTORY=HOST_URL+"get_attendance_history";
  static const GET_AGENDA_DETAIL=HOST_URL+"get_agenda";
  static const GET_AGENDA_UNCONF=HOST_URL+"get_event_agenda";
  static const GET_LIVE_POLLS=HOST_URL+"get_polls";
  static const GET_ROOM_LIST=HOST_URL+"get_room_details";

  ///Login api
  static Future<dynamic> login(params) async {
    final response = await http.post(
      Uri.parse(signIn),
      body: params,
      // headers: {
      //   "Content-Type": "application/json",
      //   "Authorization":
      //   "Bearer <token goes here>",
      // },
      //
    );
    // if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      print(responseJson);
      return ResultLogin.fromJson(responseJson);
    // }
  }

  //get attendance data api
  static Future<dynamic> getAttendanceDeta(params) async {
    final response = await http.post(
      Uri.parse(GET_ATTENDANCE),
      body: params,
      headers: {
        // "Content-Type": "application/json",
        "Authorization":"Bearer "+ UtilPreferences.getString("token").toString(),
      },

    );
    final responseJson = json.decode(response.body);
    print(responseJson);
    return AttendanceDateResp.fromJson(responseJson);

  }

  //Payment History
  static Future<dynamic> getAttendanceHistory(params) async {
    final response = await http.post(
      Uri.parse(GET_ATTENDANCE_HISTORY),
      body: params,
      headers: {
        "Authorization": "Bearer "+
        UtilPreferences.getString("token").toString(),
      },
    );

    final responseJson = json.decode(response.body);
    print(responseJson);
    return AttendanceHistoryRepo.fromJson(responseJson);

  }

  static Future<dynamic> getAgenta(params) async {
    final response = await http.post(
      Uri.parse(GET_AGENDA_DETAIL),
      body: params,
      headers: {
        "Authorization":"Bearer "+UtilPreferences.getString("token").toString(),
      },
      //
    );
    // if (response.statusCode == 200) {
    final responseJson = json.decode(response.body);
    print(responseJson);
    return AgendaRepo.fromJson(responseJson);
    // }
  }

  static Future<dynamic> getAgendaUnconf(params) async {
    final response = await http.post(
      Uri.parse(GET_AGENDA_UNCONF),
      body: params,
      headers: {
        "Authorization":"Bearer "+UtilPreferences.getString("token").toString(),
      },
      //
    );
    // if (response.statusCode == 200) {
    final responseJson = json.decode(response.body);
    print(responseJson);
    return UnconferenceAgendaResp.fromJson(responseJson);
    // }
  }

  static Future<dynamic> getLivePoll(params) async {
    final response = await http.post(
      Uri.parse(GET_LIVE_POLLS),
      body: params,
      headers: {
        "Authorization":"Bearer "+UtilPreferences.getString("token").toString(),
      },
      //
    );
    // if (response.statusCode == 200) {
    final responseJson = json.decode(response.body);
    print(responseJson);
    return LivePollsResp.fromJson(responseJson);
    // }
  }

  static Future<dynamic> getRoomList() async {
    final response = await http.get(
      Uri.parse(GET_ROOM_LIST),
      headers: {
        "Authorization":"Bearer "+UtilPreferences.getString("token").toString(),
      },
      //
    );
    // if (response.statusCode == 200) {
    final responseJson = json.decode(response.body);
    print(responseJson);
    return RoomListResp.fromJson(responseJson);
    // }
  }


}
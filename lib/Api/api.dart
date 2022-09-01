import 'dart:async';

import 'package:flutter_app/Models/model_login.dart';
import 'package:flutter_app/Models/model_paymentHistory.dart';
import 'package:flutter_app/Utils/application.dart';
import 'package:flutter_app/Utils/util_preferences.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

import '../Models/model_boothDetails.dart';
import '../Models/model_votingQues.dart';


class Api {

  // static const String HOST_URL="https://13.235.176.176/api/";//updated on 23/12/2020
  static const String HOST_URL="http://infocepts.ezii.live/api/";//updated on 23/12/2020
  static const APIKEY="apikey=4b9d3423805c3c108cab8d7693426325b8f1ee07";
  static const signIn=HOST_URL+"login";
  static const SCAN_QR=HOST_URL+"attendance";
  static const GET_ATTENDANCE=HOST_URL+"get_attendance";
  static const GET_ATTENDANCE_HISTORY=HOST_URL+"get_attendance_history";
  static const GET_AGENDA_DETAIL=HOST_URL+"get_agenda";
  static const GET_BOOTH_DETAILS=HOST_URL+"get_booth_details";
  static const GET_VOTING_QUESTIONS=HOST_URL+"get_voting_questions";


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

  //scan qr code api
  static Future<dynamic> scanQrCode(params) async {
    final response = await http.post(
      Uri.parse(signIn),
      body: params,
      headers: {
        "Content-Type": "application/json",
        "Authorization":
       UtilPreferences.getString("token").toString(),
      },
      //
    );
    // if (response.statusCode == 200) {
    final responseJson = json.decode(response.body);
    print(responseJson);
    return ResultLogin.fromJson(responseJson);
    // }
  }

  //Get Attendance History
  static Future<dynamic> getAttendanceHistory(params) async {
    final response = await http.post(
      Uri.parse(GET_ATTENDANCE_HISTORY),
      body: params,
      headers: {
        "Authorization": "Bearer"+
        UtilPreferences.getString("token").toString(),
      },
      //
    );
    // if (response.statusCode == 200) {
    final responseJson = json.decode(response.body);
    print(responseJson);
    return AttendanceHistoryRepo.fromJson(responseJson);
    // }
  }

  //GetAgenda
  static Future<dynamic> getAgenta(params) async {
    final response = await http.post(
      Uri.parse(GET_AGENDA_DETAIL),
      body: params,
      headers: {
        "Authorization":
        UtilPreferences.getString("token").toString(),
      },
      //
    );
    // if (response.statusCode == 200) {
    final responseJson = json.decode(response.body);
    print(responseJson);
    return ResultLogin.fromJson(responseJson);
    // }
  }

  //Get Booth Details
  static Future<dynamic> getBoothDetails(params) async {
    final response = await http.post(
      Uri.parse(GET_BOOTH_DETAILS),
      body: params,
      headers: {
        "Authorization": "Bearer"+
        UtilPreferences.getString("token").toString(),
      },
      //
    );
    // if (response.statusCode == 200) {
    final responseJson = json.decode(response.body);
    print(responseJson);
    return BoothDetailsRepo.fromJson(responseJson);
    // }
  }

  //Get Voting Questions
  static Future<dynamic> getVotingQue() async {
    final response = await http.get(
      Uri.parse(GET_VOTING_QUESTIONS),
      headers: {
        "Authorization": "Bearer"+
            UtilPreferences.getString("token").toString(),
      },
      //
    );
    // if (response.statusCode == 200) {
    final responseJson = json.decode(response.body);
    print(responseJson);
    return VotingQueRepo.fromJson(responseJson);
    // }
  }

}
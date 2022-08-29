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

  // ///Get from Storage
  dynamic getUser() {
    return UtilPreferences.getString(Preferences.user);
  }
  //

  //
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


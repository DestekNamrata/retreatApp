import 'dart:async';

import 'package:flutter_app/Models/model_login.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';


class Api {

  // static const String HOST_URL="https://13.235.176.176/api/";//updated on 23/12/2020
  static const String HOST_URL="http://infocepts.ezii.live/api/";//updated on 23/12/2020
  static const APIKEY="apikey=4b9d3423805c3c108cab8d7693426325b8f1ee07";
  static const signIn=HOST_URL+"login";


  ///Login api
  static Future<dynamic> login(params) async {
    final response = await http.post(
      Uri.parse(signIn),
      body: params,
    );
    // if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      print(responseJson);
      return ResultLogin.fromJson(responseJson);
    // }
  }


}
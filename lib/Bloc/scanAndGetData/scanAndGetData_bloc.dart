import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_app/Api/api.dart';
import 'package:flutter_app/Bloc/authentication/authentication_event.dart';
import 'package:flutter_app/Bloc/login/login_event.dart';
import 'package:flutter_app/Bloc/login/login_state.dart';
import 'package:flutter_app/Bloc/scanAndGetData/bloc.dart';
import 'package:flutter_app/Models/model_attendance_det.dart';
import 'package:flutter_app/Models/model_login.dart';
import 'package:flutter_app/Repository/UserRepository.dart';
import 'package:flutter_app/Utils/application.dart';
import 'package:flutter_app/Utils/util_preferences.dart';
import 'package:flutter_app/app_bloc.dart';

import 'package:http/http.dart' as http;


class ScanAndGetDataBloc extends Bloc<ScanAndGetDataEvent, ScanAndGetDataState> {
  ScanAndGetDataBloc({this.userRepository}) : super(InitialScanState());
  final UserRepository? userRepository;


  @override
  Stream<ScanAndGetDataState> mapEventToState(event) async* {
    if(event is OnScanQrCode){
     yield ScanDataLoading();

     Map<String,String> params={
      'user_id':Application.user!.id.toString(),
       'attendance_type':event.attendanceType!,
       'room_no':event.room_no!
     };
     var response ;

     try{
       response= await http.post(
         Uri.parse(Api.SCAN_QR),
         body:params,
         headers: {
           "Content-Type": "application/json",
           "Authorization":"Bearer "+UtilPreferences.getString("token").toString(),
         },
       );
       if (response.statusCode == 200) {
         final resp = json.decode(response.body);


         yield ScanQrCodeSuccess(
             msg: resp['msg']
         );

       }
     }catch(e)
     {

     }
    }

    //for attendance type
    if(event is OnGetAttendanceData){
      yield ScanDataLoading();

      final AttendanceDateResp result = await userRepository!.getAttendanceData(
          attendanceType: event.attendanceType,
          roomNo: event.room_no
      );
      if (result.success==true) {
        ///Login API success
        final Data data = Data.fromJson(result.data);
        try {
          yield GetAttendanceDataSuccess(data: data);
        } catch (error) {
          print(error);
        }
      }
    }
  }
}

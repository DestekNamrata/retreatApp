import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';

import 'package:http/http.dart' as http;
import '../../Api/api.dart';
import '../../Repository/UserRepository.dart';
import '../../Utils/application.dart';
import '../../Utils/util_preferences.dart';
import 'sos_event.dart';
import 'sos_state.dart';

//for multipart
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';



class SOSBloc extends Bloc<SOSEvent, SOSState> {
  SOSBloc({this.userRepository}) : super(InitialSOSState());
  final UserRepository? userRepository;


  @override
  Stream<SOSState> mapEventToState(event) async* {


    //get sos emergancy
    if (event is GetSOS) {
      yield SOSLoading();
      Map<String, String> params;
      params = {
        'user_id': event.userId
      };

      var response = await http.post(
          Uri.parse(Api.GET_SOS),
          headers: {
            "Authorization": "Bearer "+UtilPreferences.getString("token").toString(),
          },
          body: params
      );

      try {
        final resp = json.decode(response.body);
        if (resp['success'] == true) {
          yield GetsosSuccess(msg: resp['msg']);
        }
      } catch (e) {
        print(e);
        rethrow;
      }
    }


  }
}




import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_app/Bloc/authentication/authentication_event.dart';
import 'package:flutter_app/Bloc/login/login_event.dart';
import 'package:flutter_app/Bloc/login/login_state.dart';
import 'package:flutter_app/Models/model_login.dart';
import 'package:flutter_app/Repository/UserRepository.dart';
import 'package:flutter_app/app_bloc.dart';

import 'package:http/http.dart' as http;


class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({this.userRepository}) : super(InitialLoginState());
  final UserRepository? userRepository;


  @override
  Stream<LoginState> mapEventToState(event) async* {
    // ///Event for login
    if (event is OnLogin) {
      ///Notify loading to UI
      yield LoginLoading();

      ///Fetch API via repository
      final ResultLogin result = await userRepository!.login(mobile: event.mobile,password: "123");
      ///Case API fail but not have token
      if (result.success==true) {
        ///Login API success
        final User user = User.fromJson(result.data);
        try {
          ///Begin start AuthBloc Event AuthenticationSave
          AppBloc.authBloc.add(OnSaveUser(user));
          yield LoginSuccess(userModel: user,msg:result.msg);
        } catch (error) {
          ///Notify loading to UI
          yield LoginFail(msg: result.msg);
        }
      } else {
        ///Notify loading to UI
        yield LoginFail(msg:result.msg);
      }
    }
    //
    //
    //
    // ///Event for logout
    // if (event is OnLogout) {
    //   yield LogoutLoading();
    //   try {
    //     ///Begin start AuthBloc Event OnProcessLogout
    //     // AppBloc.authBloc.add(OnClear());
    //     //updated on 14/01/2022 for logout api to clear all cart data from server side
    //     Map<String, String> params = {
    //       'fb_id': Application.user.fbId,
    //     };
    //
    //     var response = await http.post(
    //     Uri.parse(Api.LOGOUT),
    //       body: params,
    //     );
    //     if (response.statusCode == 200) {
    //       var resp = json.decode(response.body); //for dio dont need to convert to json.decode
    //       if(resp['msg']=="Success"){
    //         //updated on 10/02/2021
    //         final deletePreferences = await userRepository.deleteUser();
    //         final deletePreferCart = await userRepository.deleteCart();
    //
    //         ///Clear user Storage user via repository
    //         Application.user = null;
    //         Application.cartModel = null;
    //
    //         /////updated on 10/02/2021
    //         if (deletePreferences || deletePreferCart) {
    //           yield LogoutSuccess();
    //         } else {
    //           final String message = "Cannot delete user data to storage phone";
    //           throw Exception(message);
    //         }
    //       }
    //       else{
    //         ///Notify loading to UI
    //         yield LogoutFail("error");
    //       }
    //       }
    //
    //       // yield LogoutSuccess();
    //     } catch (error) {
    //     ///Notify loading to UI
    //     yield LogoutFail(error.toString());
    //   }
    //
    // }
  }
}


import 'package:flutter_app/Models/model_login.dart';
import 'package:meta/meta.dart';

@immutable
abstract class LoginState {}

class InitialLoginState extends LoginState {}

class LoginLoading extends LoginState {}

class LoginFail extends LoginState {
  final String? msg;

  LoginFail({this.msg});
}

class LoginSuccess extends LoginState {
  User? userModel;
  String? msg;
  LoginSuccess({this.userModel,this.msg});

}

class LogoutLoading extends LoginState {}

class LogoutFail extends LoginState {
  final String message;

  LogoutFail(this.message);
}

class LogoutSuccess extends LoginState {}

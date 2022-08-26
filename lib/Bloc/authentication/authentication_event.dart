

import 'package:flutter_app/Models/model_login.dart';

abstract class AuthenticationEvent {}

class OnAuthCheck extends AuthenticationEvent {}

class OnSaveUser extends AuthenticationEvent {
  final User user;
  OnSaveUser(this.user);

}

class OnSaveImage extends AuthenticationEvent {
  final String profilePic;
  OnSaveImage(this.profilePic);

}


class OnClear extends AuthenticationEvent {}

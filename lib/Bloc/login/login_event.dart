abstract class LoginEvent {}

class OnLogin extends LoginEvent {

  var mobile,pwd;

  // OnLogin({this.username, this.password}); //commented on 8/02/2021
  OnLogin({this.mobile,this.pwd});

}


class OnLogout extends LoginEvent {
  OnLogout();
}

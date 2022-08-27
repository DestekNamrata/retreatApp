import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Bloc/login/login_bloc.dart';
import 'package:flutter_app/Bloc/login/login_event.dart';
import 'package:flutter_app/Bloc/login/login_state.dart';
import 'package:flutter_app/Configs/image.dart';
import 'package:flutter_app/Configs/theme.dart';
import 'package:flutter_app/Screens/mainNavigation.dart';
import 'package:flutter_app/Utils/connectivity_check.dart';
import 'package:flutter_app/Utils/translate.dart';
import 'package:flutter_app/Widgets/app_button.dart';
import 'package:flutter_app/Widgets/app_dialogs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';



class OtpScreen extends StatefulWidget{
  String? mobileNum, verificationId;

  OtpScreen({Key? key, @required this.mobileNum,@required this.verificationId}) : super(key: key);
  _OtpScreenState createState()=>_OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen>{

   var _firstDigit;
   var _secondDigit;
   var _thirdDigit;
   var _fourthDigit;
   var _fifthDigit;
   var _sixthDigit;

  int? _currentDigit;
  String authStatus="",deviceId="",token="";
  var otp;
  AuthCredential? authservice;
  LoginBloc? _loginBloc;
  bool isconnectedToInternet = false;


  var scaffoldKey = new GlobalKey<ScaffoldState>();
  var number,firebaseUser_Id;
  UserCredential? authResult;

  @override
  void initState() {
    _loginBloc = BlocProvider.of<LoginBloc>(context);
  }

  //check otp
  Future<dynamic> checkotp(dynamic phone) async {
    if (widget.verificationId != null && otp != null) {
      try {
        // authservice =await FirebaseAuth.instance(
        //     PhoneAuthProvider.credential(
        //   verificationId: verificationId,
        //   smsCode: otp,
        // ));
        authservice =
            PhoneAuthProvider.credential(
              verificationId: widget.verificationId.toString(),
              smsCode: otp,
            );
      } catch (e) {
        print(e);
      }
    }
      // call signin method
      signIn(authservice!, phone);
    }

  //updated to check valid sms code
  //SignIn
  signIn(AuthCredential credential, phone) async {
    authResult = await FirebaseAuth.instance
        .signInWithCredential(credential)
        .catchError((onError) {
      print('SignIn Error: ${onError.toString()}\n\n');
    });

    if (authResult != null) {
      firebaseUser_Id=authResult!.user!.uid.toString();

      print("fb_id"+firebaseUser_Id);
      isconnectedToInternet = await ConnectivityCheck.checkInternetConnectivity();
      if (isconnectedToInternet == true) {

        _loginBloc!.add(OnLogin(
          mobile: phone,
          pwd: "123",
        ));

      }else{
        CustomDialogs.showDialogCustom(
            "Internet", "Please check your Internet Connection!", context);
      }
    } else {
      scaffoldKey.currentState!.showSnackBar(SnackBar(
            content: Text("Please enter valid sms code"),
          ));
    }
  }
  // Return "OTP" input field
  get _getInputField {
    return
      Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _otpTextField(_firstDigit),
        _otpTextField(_secondDigit),
        _otpTextField(_thirdDigit),
        _otpTextField(_fourthDigit),
        _otpTextField(_fifthDigit),
        _otpTextField(_sixthDigit),
      ],
    );
  }

  ///On show message fail
  Future<void> _showMessage(String message,int? role) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "OTP Verification",
            style:TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              color: AppTheme.textColor
            )
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  message,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                Translate.of(context)!.translate('close'),
              ),
              onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>MainNavigation(userType:role.toString())));

              },
            ),
          ],
        );
      },
    );
  }

  // Returns "Otp custom text field"
  Widget _otpTextField(var digit) {
    return
      Expanded(
        child:
        Container(
            width: MediaQuery.of(context).size.width,
            height: 40.0,
            margin: EdgeInsets.all(4.0),
            alignment: Alignment.center,
            child: Text(
              digit != null ? digit.toString() : "",
              style: TextStyle(
                  fontSize: 18.0,
                  color: AppTheme.textColor,
                  fontFamily: 'Poppins',
                fontWeight: FontWeight.w600
              ),
            ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: digit==null?
              Color(0xFFFFD8BC)
              :
              Theme.of(context).primaryColor,  // red as border color
            ),
            color:digit==null?
            Color(0xFFFFD8BC)
                :
            Colors.white,

          ),
            ),
      );
  }

   // Returns "Otp" keyboard
   get _getOtpKeyboard {
     return Container(
       margin: EdgeInsets.only(top:5.0),
         height: MediaQuery.of(context).size.width-100,
         child: Column(
           children: <Widget>[
             Expanded(
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: <Widget>[
                   _otpKeyboardInputButton(
                       label: "1",
                       onPressed: () {
                         _setCurrentDigit(1);
                       }),
                   _otpKeyboardInputButton(
                       label: "2",
                       onPressed: () {
                         _setCurrentDigit(2);
                       }),
                   _otpKeyboardInputButton(
                       label: "3",
                       onPressed: () {
                         _setCurrentDigit(3);
                       }),
                 ],
               ),
             ),
             Expanded(
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: <Widget>[
                   _otpKeyboardInputButton(
                       label: "4",
                       onPressed: () {
                         _setCurrentDigit(4);
                       }),
                   _otpKeyboardInputButton(
                       label: "5",
                       onPressed: () {
                         _setCurrentDigit(5);
                       }),
                   _otpKeyboardInputButton(
                       label: "6",
                       onPressed: () {
                         _setCurrentDigit(6);
                       }),
                 ],
               ),
             ),
             Expanded(
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: <Widget>[
                   _otpKeyboardInputButton(
                       label: "7",
                       onPressed: () {
                         _setCurrentDigit(7);
                       }),
                   _otpKeyboardInputButton(
                       label: "8",
                       onPressed: () {
                         _setCurrentDigit(8);
                       }),
                   _otpKeyboardInputButton(
                       label: "9",
                       onPressed: () {
                         _setCurrentDigit(9);
                       }),
                 ],
               ),
             ),
             Expanded(
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: <Widget>[

                   Visibility(
                     maintainSize: true,
                     maintainAnimation: true,
                     maintainState: true,
                     visible: _sixthDigit != null,
                     child: _otpKeyboardActionButton(
                         label: Icon(
                           Icons.check_circle,
                           color: Colors.black,
                         ),
                         onPressed: () {
                           // you can dall OTP verification API.
                         }),
                   ),

                   _otpKeyboardInputButton(
                       label: "0",
                       onPressed: () {
                         _setCurrentDigit(0);
                       }),
                   _otpKeyboardActionButton(
                       label: Icon(
                         Icons.backspace,
                         color: Colors.black,
                       ),
                       onPressed: () {
                         setState(() {
                           if (_sixthDigit != null) {
                             _sixthDigit = null;
                           } else if (_fifthDigit != null) {
                             _fifthDigit = null;
                           }else if (_fourthDigit != null) {
                             _fourthDigit = null;
                           } else if (_thirdDigit != null) {
                             _thirdDigit = null;
                           } else if (_secondDigit != null) {
                             _secondDigit = null;
                           } else if (_firstDigit != null) {
                             _firstDigit = null;
                           }
                         });
                       }),
                 ],
               ),
             ),
           ],
         ));
   }

  // Returns "Otp keyboard input Button"
  Widget _otpKeyboardInputButton({String? label, VoidCallback? onPressed}) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: new BorderRadius.circular(40.0),
        child: Container(
          height: 80.0,
          width: 80.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              label!,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Returns "Otp keyboard action Button"
  _otpKeyboardActionButton({Widget? label, VoidCallback? onPressed}) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(40.0),
      child: Container(
        height: 80.0,
        width: 80.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Center(
          child: label,
        ),
      ),
    );
  }

  // Current digit
  void _setCurrentDigit(int i) {
    setState(() {
      _currentDigit = i;
      if (_firstDigit == null) {
        _firstDigit = _currentDigit;
      } else if (_secondDigit == null) {
        _secondDigit = _currentDigit;
      } else if (_thirdDigit == null) {
        _thirdDigit = _currentDigit;
      } else if (_fourthDigit == null) {
        _fourthDigit = _currentDigit;
      }
      else if (_fifthDigit == null) {
        _fifthDigit = _currentDigit;
      }
      else if (_sixthDigit == null) {
        _sixthDigit = _currentDigit;

        otp = _firstDigit.toString() +
            _secondDigit.toString() +
            _thirdDigit.toString() +
            _fourthDigit.toString()+
            _fifthDigit.toString()+
            _sixthDigit.toString();

        // Verify your otp by here. API call
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      key: scaffoldKey,

      appBar: AppBar(
        centerTitle: true,

              title:Text('OTP Verification',style: TextStyle(
              fontFamily: 'Poppins',fontWeight: FontWeight.w600
            ),)
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,


        child: Container(
          margin: EdgeInsets.only(left: 20.0,right: 20.0),
     child:SingleChildScrollView(
  child:
  Column(
    mainAxisSize: MainAxisSize.max,
    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(height: 10.0,),
      Image.asset(Images.retreatImage,height: 180.0,width:180.0),
      Text(Translate.of(context)!.translate('otp_verification'),style: TextStyle(color:AppTheme.textColor,
          fontFamily: 'Poppins',fontWeight:FontWeight.w400,fontSize: 14.0),),
      // Text(widget.otpVerify.countrycode+" "+widget.otpVerify.phone,style: TextStyle(color:AppTheme.textColor,
      //     fontFamily: 'Poppins',fontWeight:FontWeight.w400,fontSize: 14.0),),
      SizedBox(height: 15.0,),
      Padding(
        padding:EdgeInsets.only(left:25.0,right:25.0),
          child:_getInputField),

      //for login api call
      BlocBuilder<LoginBloc,LoginState>(builder: (context,login){
        return BlocListener<LoginBloc,LoginState>(listener: (context,state){
          if (state is LoginFail) {
            // _showMessage(
            //   // Translate.of(context).translate(state.code), //commented on 9/12/2020
            //   Translate.of(context)!.translate(state.msg!),//added on 9/12/2020
            // );
            Fluttertoast.showToast(msg: Translate.of(context)!.translate(state.msg!));
          }
          if (state is LoginSuccess) {
            _showMessage(
              "Logged in successfully",state.userModel!.role//added on 9/12/2020
            );
          }

        },
          child:Padding(padding: EdgeInsets.only(left:10.0,right: 10.0,top:15.0),
              child:
              AppButton(
                onPressed: (){
                  if(_firstDigit!=null && _secondDigit!=null && _thirdDigit!=null &&
                      _fourthDigit!=null && _fifthDigit!=null && _sixthDigit!=null){
                    checkotp(widget.mobileNum);

                  }else{
                    Fluttertoast.showToast(msg: "Please enter Otp");
                  }
                },
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
                text: 'Verify',
                loading: login is LoginLoading,
                disableTouchWhenLoading: true,
              )
          ),
        );
      }),
      SizedBox(height: 15.0,),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Text(Translate.of(context)!.translate("otp_resend"),style: TextStyle(fontSize: 14.0),),
        Text(Translate.of(context)!.translate("resend"),style: TextStyle(fontSize: 14.0,fontWeight: FontWeight.w600),),
      ],),
      SizedBox(height: 15.0,),

      _getOtpKeyboard

    ],
  ),
)),
        )

    );

  }

}
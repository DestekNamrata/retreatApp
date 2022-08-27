import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/Bloc/authentication/authentication_bloc.dart';
import 'package:flutter_app/Bloc/authentication/authentication_event.dart';
import 'package:flutter_app/Configs/image.dart';
import 'package:flutter_app/Configs/theme.dart';
import 'package:flutter_app/Screens/sign_in_screen.dart';
import 'package:flutter_app/Utils/application.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shared_preferences/shared_preferences.dart';



class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {
   AuthBloc? authBloc;
   final int splashDuration = 5;

  String versionName="";


   @override
  void initState() {
     startTime();
     super.initState();
  }

  startTime() async {
     return Timer(
         await Duration(seconds: splashDuration),
             () {
           SystemChannels.textInput.invokeMethod('TextInput.hide');
           authBloc = BlocProvider.of<AuthBloc>(context);
           authBloc!.add(OnAuthCheck());
           // preferences.clear();
           // Navigator.push(
           //       context,
           //       MaterialPageRoute(
           //         builder: (context) => SignInScreen(),
           //       ),
           //     );
         }
     );
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
        Container(
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage(Images.splash),
    fit: BoxFit.cover,
    ),
    ),
      child:Stack(

        alignment: Alignment.center,
        children: <Widget>[
          Center(

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                // Icon(Icons.ac_unit,size: 40.0,)
                Image.asset(Images.logo, width: 300, height: 300),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: SizedBox(
              width: 10,
              height: 10,
              child: CircularProgressIndicator(strokeWidth: 1),
            ),
          ),
          Positioned(
            bottom: 15.0,
              child:
              // Platform.isAndroid
              // ?
              // Text("version "+Application.version,style: TextStyle(
              //   fontSize: 16.0,
              //   fontFamily: 'Poppins',
              //   fontWeight: FontWeight.w500,
              //   color: AppTheme.textColor
              // ),)
              // :
              // Text("version "+Application.Iosversion,style: TextStyle(
              //     fontSize: 16.0,
              //     fontFamily: 'Poppins',
              //     fontWeight: FontWeight.w500,
              //     color: AppTheme.textColor
              // ),)
              Image.asset(Images.infoceptText, width: 100, height: 100),

          )
        ],
      )),
    );
  }
}

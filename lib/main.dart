import 'dart:async';


import 'package:flutter/material.dart';
import 'package:flutter_app/Utils/application.dart';
import 'package:flutter_app/app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Utils/routes.dart';
import 'package:firebase_core/firebase_core.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //to set stripe publishable key
  // Stripe.publishableKey = Application.publishableKey;
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await Firebase.initializeApp();

  Bloc.observer = BlocObserver();

  Application.preferences = await SharedPreferences.getInstance();
  final route = Routes();

  runApp(App());

  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //   statusBarColor: Color(0xffDF5F00),
  // ));
}


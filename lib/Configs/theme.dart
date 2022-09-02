import 'package:flutter/material.dart';
import 'package:flutter_app/Configs/theme_collection.dart';
import 'package:flutter_app/Models/model_theme.dart';



enum DarkOption { dynamic, alwaysOn, alwaysOff }

class AppTheme {
  ///Optional Color
  static Color blueColor = Color.fromRGBO(93, 173, 226, 1);
  static Color pinkColor = Color.fromRGBO(165, 105, 189, 1);
  static Color greenColor = Color.fromRGBO(88, 214, 141, 1);

  static Color textColor=Color(0xFF085775);
  static Color bgColor=Color(0xFF00000029);
  static const dayColor=Color(0xFFFB7723);
  static Color appColor=Color(0xffEA357C);
  static Color textHighlight=Color(0xff889DAC);
  static Color backgroundColor=Color(0xFFE2E7EE);


  ///Default font
  static String currentFont = "Inter";

  ///List Font support
  static List<String> fontSupport = ["SquadaOne", "Roboto", "Merriweather"];

  ///Default Theme
  static ThemeModel currentTheme = ThemeModel.fromJson({
    "name": "darkpink",
    "color": Color(0xffEA357C),
    "light": "primaryLight",
    "dark": "primaryDark",
  });

  ///List Theme Support in Application
  static List themeSupport = [
    {
      "name": "default",
      // "color": Color(0xff03502B),
      "color": Color(0xffEA357C),
      "light": "primaryLight",
      "dark": "primaryDark",
    },
    {
      "name": "brown",
      "color": Color(0xffa0877e),
      "light": "brownLight",
      "dark": "brownDark",
    },
    {
      "name": "blue",
      "color": Color(0xff0172BE),
      "light": "pinkLight",
      "dark": "pinkDark",
    },
    {
      "name": "orange",
      "color": Color(0xfff6bb41),
      "light": "pastelOrangeLight",
      "dark": "pastelOrangeDark",
    },
    {
      "name": "green",
      "color": Color(0xff93b7b0),
      "light": "greenLight",
      "dark": "greenDark",
    },
  ].map((item) => ThemeModel.fromJson(item)).toList();

  ///Dark Theme option
  static DarkOption darkThemeOption = DarkOption.dynamic;

  static ThemeData lightTheme = CollectionTheme.getCollectionTheme(
    theme: currentTheme.lightTheme,
  );

  static bool isLightMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light;
  }

  static ThemeData darkTheme = CollectionTheme.getCollectionTheme(
    theme: currentTheme.darkTheme,
  );

  ///Singleton factory
  static final AppTheme _instance = AppTheme._internal();

  factory AppTheme() {
    return _instance;
  }

  AppTheme._internal();
}

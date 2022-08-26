import 'package:flutter_app/Configs/theme.dart';
import 'package:flutter_app/Models/model_theme.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ThemeEvent {}

class OnChangeTheme extends ThemeEvent {
  final ThemeModel? theme;
  final String? font;
  final DarkOption? darkOption;

  OnChangeTheme({
    this.theme,
    this.font,
    this.darkOption,
  });
}

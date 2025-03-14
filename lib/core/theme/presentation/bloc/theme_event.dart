import 'package:flutter/material.dart';

abstract class ThemeEvent {}

class SystemThemeChanged extends ThemeEvent {
  final Brightness brightness;

  SystemThemeChanged(this.brightness);
}

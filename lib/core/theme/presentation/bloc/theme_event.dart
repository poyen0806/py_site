import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ThemeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SystemThemeChanged extends ThemeEvent {
  final Brightness brightness;

  SystemThemeChanged(this.brightness);

  @override
  List<Object?> get props => [brightness];
}

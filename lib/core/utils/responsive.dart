import 'package:flutter/widgets.dart';

/// Responsive class to calculate the responsive size of the screen
/// The base width and height are based on the design size of the screen
/// The design size is 1440 x 900 for desktop, and it scales down for mobile devices.

class Responsive {
  static double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  /// This function calculates proportional width based on the design width.
  static double getProportionateScreenWidth(BuildContext context, double inputWidth, {double baseWidth = 1440.0}) {
    double screenWidth = getWidth(context);
    return (inputWidth / baseWidth) * screenWidth;
  }

  /// This function calculates proportional height based on the design height.
  static double getProportionateScreenHeight(BuildContext context, double inputHeight, {double baseHeight = 900.0}) {
    double screenHeight = getHeight(context);
    return (inputHeight / baseHeight) * screenHeight;
  }
}

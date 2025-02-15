import 'package:flutter/material.dart';

class Constants {
  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  //other constants
  static const double insidepadding = 20;
  static const double avatarRadius = 50;
  static const double appBarHeight = 90;
  static const double borderRadius = 25;
  static const double maxWidthDrawer = 268.0;
}

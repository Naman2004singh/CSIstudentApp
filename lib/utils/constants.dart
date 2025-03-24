import 'package:flutter/material.dart';

class Constants {
  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  //other constants
  static const double insidepadding = 20.0;
  static const double smallPadding = 10.0;
  static const double avatarRadius = 50.0;
  static const double appBarHeight = 90.0;
  static const double borderRadius = 28.0;
  static const double smallradius = 15.0;
  static const double backButtonSize = 32.0;
  static const double maxWidthDrawer = 268.0;
  static const double sizedBoxHeight = 25.0;
  static const double smallSizedBox = 10.0;
}

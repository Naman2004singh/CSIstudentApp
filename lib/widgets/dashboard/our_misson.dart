import 'package:csi_app/utils/colors.dart';
import 'package:csi_app/utils/constants.dart';
import 'package:csi_app/utils/strings.dart';
import 'package:csi_app/utils/styles.dart';
import 'package:flutter/material.dart';

class OurMisson extends StatelessWidget {
  const OurMisson({super.key});

  @override
  Widget build(BuildContext context) {
    String missonText = AllStrings.ourMisson;
    double padding = Constants.insidepadding;
    double smallpadding = Constants.smallPadding;

    double width = Constants.screenWidth(context);
    double borderRadius = Constants.borderRadius;
    return Container(
      width: width,
      margin: EdgeInsets.symmetric(horizontal: padding),
      padding:
          EdgeInsets.symmetric(horizontal: padding, vertical: smallpadding),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: AllColors.whiteColor),
      child: Text(
        missonText,
        style: Textstyle.bodyMedium,
        textAlign: TextAlign.center,
      ),
    );
  }
}

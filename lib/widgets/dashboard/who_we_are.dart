import 'package:csi_app/utils/colors.dart';
import 'package:csi_app/utils/constants.dart';
import 'package:csi_app/utils/strings.dart';
import 'package:csi_app/utils/styles.dart';
import 'package:flutter/material.dart';

class WhoWeAre extends StatelessWidget {
  const WhoWeAre({super.key});

  @override
  Widget build(BuildContext context) {
    double padding = Constants.insidepadding;
    double boderRadius = Constants.borderRadius;
    double smallsized = Constants.smallSizedBox;
    double smallpadding = Constants.smallPadding;
    String mainText = AllStrings.whoWeAre;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: padding),
      padding:
          EdgeInsets.symmetric(horizontal: padding, vertical: smallpadding),
      decoration: BoxDecoration(
          color: AllColors.mainColor,
          borderRadius: BorderRadius.circular(boderRadius)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "TEAM CSI",
            style: Textstyle.headlineLargeWhite,
          ),
          SizedBox(
            height: smallsized,
          ),
          Text(
            mainText,
            textAlign: TextAlign.center,
            style: Textstyle.bodyLargeWhite,
          )
        ],
      ),
    );
  }
}
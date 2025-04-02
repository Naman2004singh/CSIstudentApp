import 'package:csi_app/utils/colors.dart';
import 'package:csi_app/utils/constants.dart';
import 'package:csi_app/utils/styles.dart';
import 'package:flutter/material.dart';

Widget regButton(String status) {
  double boderradius = Constants.borderRadius;
  double padding = Constants.smallPadding;
  switch (status.toLowerCase()) {
    case 'ongoing':
      return GestureDetector(
        child: Center(
          child: Container(
            width: 200,
            padding: EdgeInsets.all(padding),
            decoration: BoxDecoration(
                color: AllColors.darkBlue,
                borderRadius: BorderRadius.circular(boderradius)),
            child: Text(
              textAlign: TextAlign.center,
              "REGISTER NOW",
              style: Textstyle.bodyLargeWhite,
            ),
          ),
        ),
      );
    case 'upcoming':
      return Center(
        child: Container(
          width: 200,
          padding: EdgeInsets.all(padding),
          decoration: BoxDecoration(
              color: AllColors.lightBlueColor,
              borderRadius: BorderRadius.circular(boderradius),
              border: Border.all(color: AllColors.darkBlue, width: 2.0)),
          child: Text(
            textAlign: TextAlign.center,
            "COMING SOON",
            style: Textstyle.blueText,
          ),
        ),
      );
    case 'previous':
      return Center(
        child: Container(
          width: 200,
          padding: EdgeInsets.all(padding),
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 196, 196),
              borderRadius: BorderRadius.circular(boderradius),
              border: Border.all(color: AllColors.redColor, width: 2.0)),
          child: Text(
            textAlign: TextAlign.center,
            "REGISTRATION CLOSED",
            style: Textstyle.redText,
          ),
        ),
      );
    default:
      return Container(
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
            color: AllColors.lightBlueColor,
            borderRadius: BorderRadius.circular(boderradius),
            border: Border.all(color: AllColors.darkBlue, width: 2.0)),
        child: Text(
          "UPDATING",
          style: Textstyle.blueText,
        ),
      );
  }
}

import 'package:csi_app/utils/colors.dart';
import 'package:csi_app/utils/strings.dart';
import 'package:csi_app/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:csi_app/utils/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OurFeatures extends StatelessWidget {
  const OurFeatures({super.key});

  @override
  Widget build(BuildContext context) {
    double padding = Constants.insidepadding;
    double width = Constants.screenWidth(context);
    double smallpadding = Constants.smallPadding;
    double boderRadius = Constants.borderRadius;
    List iconImage = AllStrings.iconName;

    return Container(
      width: width,
      margin: EdgeInsets.symmetric(horizontal: padding),
      padding:
          EdgeInsets.symmetric(horizontal: padding, vertical: smallpadding),
      decoration: BoxDecoration(
          color: AllColors.greyColor,
          borderRadius: BorderRadius.circular(boderRadius)),
      child: Column(
          children: iconImage.map((value) {
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: AllColors.mainColor,
            child: SvgPicture.asset(value["image"]),
          ),
          title: Text(
            value["name"],
            style: Textstyle.headlineMedium,
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            size: 20.0,
          ),
        );
      }).toList()),
    );
  }
}

import 'package:csi_app/pages/mobile/tabs/dashboard.dart';
import 'package:csi_app/utils/colors.dart';
import 'package:csi_app/utils/constants.dart';
import 'package:csi_app/utils/styles.dart';
import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  final String description;
  final String guidelines;
  const Description(
      {super.key, required this.description, required this.guidelines});

  @override
  Widget build(BuildContext context) {
    double bRadius = Constants.borderRadius;
    double padding = Constants.insidepadding;
    double smallpadding = Constants.smallPadding;
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(padding),
          padding:
              EdgeInsets.symmetric(horizontal: padding, vertical: smallpadding),
          decoration: BoxDecoration(
              color: AllColors.whiteColor,
              borderRadius: BorderRadius.circular(bRadius)),
          child: Column(
            children: [
              Text(
                "Description",
                textAlign: TextAlign.center,
                style: Textstyle.headlineSmall,
              ),
              Text(
                description,
                textAlign: TextAlign.center,
                style: Textstyle.bodyMedium,
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.all(padding),
          padding:
              EdgeInsets.symmetric(horizontal: padding, vertical: smallpadding),
          decoration: BoxDecoration(
              color: AllColors.whiteColor,
              borderRadius: BorderRadius.circular(bRadius)),
          child: Column(
            children: [
              Text(
                "Rules & Guidelines",
                textAlign: TextAlign.center,
                style: Textstyle.headlineSmall,
              ),
              Text(
                guidelines,
                textAlign: TextAlign.center,
                style: Textstyle.bodyMedium,
              ),
            ],
          ),
        )
      ],
    );
  }
}

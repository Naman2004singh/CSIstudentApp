import 'package:flutter/material.dart';
import 'package:csi_app/utils/styles.dart';
import 'package:csi_app/utils/constants.dart';


double padding = Constants.insidepadding;

class Headings extends StatelessWidget {
  const Headings({super.key, required this.heading, required this.sideOptions});

  final String heading;
  final String sideOptions;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            heading,
            style: Textstyle.headlineLarge,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                sideOptions,
                style: Textstyle.sideOptionsText,
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: 12.0,
              )
            ],
          )
        ],
      ),
    );
  }
}

class SmallHeading extends StatelessWidget {
  const SmallHeading({super.key, required this.heading});

  final String heading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            heading,
            style: Textstyle.headlineLarge,
          )
        ],
      ),
    );
  }
}

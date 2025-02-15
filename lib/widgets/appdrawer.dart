import 'package:csi_app/utils/colors.dart';
import 'package:csi_app/utils/constants.dart';
import 'package:flutter/material.dart';

class Appdrawer extends StatefulWidget {
  const Appdrawer({super.key});

  @override
  State<Appdrawer> createState() => _AppdrawerState();
}

class _AppdrawerState extends State<Appdrawer> {
  double maxWidth = Constants.maxWidthDrawer;
  double radius = Constants.borderRadius;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: maxWidth),
      decoration: BoxDecoration(
          color: AllColors.whiteColor,
          borderRadius: BorderRadius.circular(radius)),
    );
  }
}

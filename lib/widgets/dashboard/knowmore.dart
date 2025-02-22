import 'package:csi_app/utils/colors.dart';
import 'package:csi_app/utils/styles.dart';
import 'package:flutter/material.dart';

class Knowmore extends StatefulWidget {
  const Knowmore({super.key});

  @override
  State<Knowmore> createState() => _KnowmoreState();
}

class _KnowmoreState extends State<Knowmore> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
        decoration: BoxDecoration(
            color: AllColors.lightBlueColor,
            borderRadius: BorderRadius.circular(20)),
        child: Text(
          "Know More",
          style: Textstyle.blueText,
        ),
      ),
    );
  }
}

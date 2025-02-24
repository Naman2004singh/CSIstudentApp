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

class CompleteStatus extends StatelessWidget {
  final String text;
  const CompleteStatus({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
      decoration: BoxDecoration(
          border: Border.all(
            color:
                text == "previous" ? AllColors.redColor : AllColors.mainColor,
          ),
          color: text == "upcoming"
              ? AllColors.whiteColor
              : AllColors.lightBlueColor,
          borderRadius: BorderRadius.circular(20)),
      child: Text(
        text,
        style: text == "previous" ? Textstyle.redText : Textstyle.blueText,
      ),
    );
  }
}

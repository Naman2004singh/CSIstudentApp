import 'package:csi_app/utils/colors.dart';
import 'package:csi_app/utils/constants.dart';
import 'package:csi_app/utils/strings.dart';
import 'package:csi_app/widgets/appdrawer.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart' hide Image;

class Appbar extends StatefulWidget {
  const Appbar({super.key});

  @override
  State<Appbar> createState() => _AppbarState();
}

class _AppbarState extends State<Appbar> {
  // on press menu icon
  late SMIBool menubtn;
  void onmenuPress() {
    if (menubtn.value) {}
    menubtn.change(!menubtn.value);
    Appdrawer();
  }

  // onMenu init
  void onMenuInit(Artboard artboard) {
    final controller = StateMachineController.fromArtboard(artboard, "SM1");
    artboard.addController(controller!);
    menubtn = controller.findInput<bool>("open") as SMIBool;
    menubtn.value = false;
  }

  @override
  Widget build(BuildContext context) {
    double width = Constants.screenWidth(context);
    double height = Constants.appBarHeight;
    double padding = Constants.insidepadding;
    double boderRadius = Constants.borderRadius;
    return SafeArea(
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: AllColors.darkBlue,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(boderRadius),
                bottomRight: Radius.circular(boderRadius))),
        child: Padding(
          padding: EdgeInsets.only(left: padding, right: padding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(AllStrings.logoCsi),
              Row(
                children: [
                  const Icon(
                    Icons.notifications,
                    color: AllColors.whiteColor,
                    size: 30,
                  ),
                  const SizedBox(
                    width: 14.0,
                  ),
                  GestureDetector(
                    onTap: onmenuPress,
                    child: SizedBox(
                      width: 38,
                      height: 38,
                      child: RiveAnimation.asset(
                        "assets/animation/menu.riv",
                        onInit: onMenuInit,
                        stateMachines: const ["SM1"],
                        animations: const ["open", "close"],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:csi_app/utils/colors.dart';
import 'package:csi_app/utils/constants.dart';
import 'package:csi_app/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rive/rive.dart' hide Image;

class Appbar extends StatefulWidget implements PreferredSizeWidget {
  const Appbar({super.key, required this.isDrawerOpen});

  final bool isDrawerOpen;
  @override
  State<Appbar> createState() => _AppbarState();

  @override
  Size get preferredSize {
    double height = Constants.appBarHeight;
    return Size.fromHeight(height);
  }
}

class _AppbarState extends State<Appbar> {
  late SMIBool menubtn;

  // onMenu init
  void onMenuInit(Artboard artboard) {
    final controller = StateMachineController.fromArtboard(artboard, "SM1");
    artboard.addController(controller!);
    menubtn = controller.findInput<bool>("open") as SMIBool;
    menubtn.value = false;
  }

  @override
  void didUpdateWidget(covariant Appbar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isDrawerOpen != widget.isDrawerOpen) {
      menubtn.value = widget.isDrawerOpen;
    }
  }

  void toggleDrawer(BuildContext context) {
    final scafold = Scaffold.of(context);
    if (scafold.isDrawerOpen) {
      scafold.closeDrawer();
    } else {
      scafold.openDrawer();
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = Constants.appBarHeight;
    // double padding = Constants.insidepadding;
    double boderRadius = Constants.borderRadius;
    double smallPadding = Constants.smallPadding;
    return SafeArea(
        child: AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: height,
      backgroundColor: AllColors.darkBlue,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(boderRadius),
              bottomRight: Radius.circular(boderRadius))),
      title: Padding(
        padding: EdgeInsets.only(left: smallPadding, right: smallPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(AllStrings.logoCSiSvg),
            Row(
              children: [
                const Icon(
                  Icons.notifications_outlined,
                  color: AllColors.whiteColor,
                  size: 30,
                ),
                const SizedBox(
                  width: 14.0,
                ),
                GestureDetector(
                  onTap: () => toggleDrawer(context),
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
    ));
  }
}

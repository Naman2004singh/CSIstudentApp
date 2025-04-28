import 'package:csi_app/utils/colors.dart';
import 'package:csi_app/utils/constants.dart';
import 'package:csi_app/widgets/AppBar/draweroption.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Appdrawer extends StatefulWidget {
  const Appdrawer({super.key});

  @override
  State<Appdrawer> createState() => _AppdrawerState();
}

class _AppdrawerState extends State<Appdrawer> {
  double maxWidth = Constants.maxWidthDrawer;
  double radius = Constants.borderRadius;
  double padding = Constants.insidepadding;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: AllColors.whiteColor,
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: SvgPicture.asset(
                      "assets/images/draweIcon.svg",
                      width: 30,
                    ),
                  ),
                  SvgPicture.asset(
                    "assets/logos/csiLogo.svg",
                    width: 40,
                  ),
                ],
              ),
              const Column(
                children: [
                  Draweroption(text: "Dashboard"),
                  Draweroption(text: "Meet Our Team"),
                  Draweroption(text: "Achievements"),
                  Draweroption(text: "Service Domains"),
                  Draweroption(text: "Contact Us")
                ],
              ),
              Row(
                children: [
                  urlLauncher(FontAwesomeIcons.instagram,
                      "https://www.instagram.com/csi_akgec/"),
                  const SizedBox(
                    width: 10.0,
                  ),
                  urlLauncher(FontAwesomeIcons.linkedin,
                      "https://www.linkedin.com/in/csi-akgec/")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:csi_app/utils/colors.dart';
import 'package:csi_app/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Draweroption extends StatelessWidget {
  final String text;
  const Draweroption({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.mediumImpact();
      },
      child: Column(
        children: [
          Text(
            text,
            style: Textstyle.headlineDrawer,
          ),
          const Divider(
            indent: 20.0,
            endIndent: 20.0,
            color: AllColors.greyBackground,
            thickness: 1.5,
          ),
          const SizedBox(
            height: 18.0,
          )
        ],
      ),
    );
  }
}

Widget urlLauncher(IconData icondata, String navigateUrl) {
  return IconButton(
      onPressed: () async {
        final Uri uri = Uri.parse(navigateUrl);
        if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
          throw Exception('Cound not Lauch');
        }
      },
      icon: FaIcon(
        icondata,
        size: 35.0,
      ));
}

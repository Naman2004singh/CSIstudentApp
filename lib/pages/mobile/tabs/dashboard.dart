import 'package:csi_app/utils/constants.dart';
import 'package:csi_app/widgets/appBar.dart';
import 'package:csi_app/widgets/carousel/event_slider.dart';
import 'package:csi_app/widgets/headings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

double padding = Constants.insidepadding;
double borderRadius = Constants.borderRadius;

class Dashboard extends ConsumerWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ListView(
        children: [
          const Appbar(),
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(borderRadius),
                    bottomRight: Radius.circular(borderRadius))),
            elevation: 10,
            child: const Column(
              children: [
                Headings(heading: "Events", sideOptions: "See all"),
                EventSlider(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

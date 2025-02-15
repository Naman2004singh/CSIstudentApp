import 'package:csi_app/utils/constants.dart';
import 'package:csi_app/widgets/appBar.dart';
import 'package:csi_app/widgets/headings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

double padding = Constants.insidepadding;

class Dashboard extends ConsumerWidget {
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ListView(
        children: const [
          Appbar(),
          Headings(heading: "Events", sideOptions: "See all"),
        ],
      ),
    );
  }
}

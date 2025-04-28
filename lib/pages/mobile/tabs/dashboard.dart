import 'package:csi_app/providers/item_providers.dart';
import 'package:csi_app/routes.dart';
import 'package:csi_app/utils/colors.dart';
import 'package:csi_app/utils/constants.dart';
import 'package:csi_app/widgets/AppBar/appBar.dart';
import 'package:csi_app/widgets/AppBar/appdrawer.dart';
import 'package:csi_app/widgets/carousel/event_slider.dart';
import 'package:csi_app/providers/event_view_model.dart';
import 'package:csi_app/widgets/dashboard/headings.dart';
import 'package:csi_app/widgets/dashboard/knowmore.dart';
import 'package:csi_app/widgets/dashboard/our_features.dart';
import 'package:csi_app/widgets/dashboard/our_misson.dart';
import 'package:csi_app/widgets/dashboard/who_we_are.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

double padding = Constants.insidepadding;
double borderRadius = Constants.borderRadius;
double sizedHeight = Constants.sizedBoxHeight;
double smallbox = Constants.smallSizedBox;

class Dashboard extends ConsumerWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double width = Constants.screenWidth(context);
    final eventViewModel = ref.watch(stateProvider);
    // final allEventitems = ref.watch(allEventProvider);
    return SafeArea(
      child: Scaffold(
          appBar: Appbar(
            isDrawerOpen: eventViewModel.isDraweOpen,
          ),
          drawer: const Appdrawer(),
          onDrawerChanged: (isOpen) {
            eventViewModel.onDraweChange(isOpen);
          },
          backgroundColor: AllColors.greyBackground,
          body: ListView(
            children: [
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Card(
                      color: AllColors.whiteColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(borderRadius),
                              bottomRight: Radius.circular(borderRadius))),
                      elevation: 10,
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                height: smallbox,
                              ),
                              Headings(
                                  heading: "Events",
                                  sideOptions: "See all",
                                  onPressed: () =>
                                      GoRouter.of(context).push("/Allevents")),
                              const EventSlider(),
                            ],
                          ),
                          Positioned(
                              bottom: 30,
                              left: width / 2.7,
                              child: Knowmore(
                                onTap: () {
                                  //Navigation
                                  GoRouter.of(context).push('/Allevents');
                                },
                              )),
                        ],
                      ))
                ],
              ),
              SizedBox(
                height: sizedHeight,
              ),
              const Headings(heading: "Who We Are", sideOptions: "Read More"),
              const WhoWeAre(),
              SizedBox(
                height: sizedHeight,
              ),
              const SmallHeading(heading: "Our Features"),
              const OurFeatures(),
              SizedBox(
                height: sizedHeight,
              ),
              const SmallHeading(heading: "Our Misson"),
              const OurMisson(),
              SizedBox(
                height: sizedHeight,
              )
            ],
          )),
    );
  }
}

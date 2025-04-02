import 'package:csi_app/providers/event_view_model.dart';
import 'package:csi_app/providers/item_providers.dart';
import 'package:csi_app/services/models/event_details_model.dart';
import 'package:csi_app/utils/colors.dart';
import 'package:csi_app/utils/constants.dart';
import 'package:csi_app/utils/styles.dart';
import 'package:csi_app/widgets/AppBar/appBar.dart';
import 'package:csi_app/widgets/AppBar/appdrawer.dart';
import 'package:csi_app/widgets/event_components/event_overview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class EventDetail extends ConsumerWidget {
  const EventDetail({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appBarViewModel = ref.watch(stateProvider);
    double backSize = Constants.backButtonSize;
    double padding = Constants.insidepadding;
    double borderRadius = Constants.smallradius;
    double largebr = Constants.borderRadius;

    final allEventdetail = ref.watch(eventDetailProvider);
    return Scaffold(
      backgroundColor: AllColors.greyBackground,
      appBar: Appbar(isDrawerOpen: appBarViewModel.isDraweOpen),
      drawer: const Appdrawer(),
      onDrawerChanged: (isOpen) {
        appBarViewModel.onDraweChange(isOpen);
      },
      body: allEventdetail.when(
          data: (data) {
            EventDetails alldetails = data;
            return Column(
              children: [
                Expanded(
                    child: NestedScrollView(
                        headerSliverBuilder: (context, innerBoxIsScrolled) {
                          return <Widget>[
                            SliverAppBar(
                              automaticallyImplyLeading: false,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(largebr)),
                              pinned: true,
                              leading: Container(
                                margin: const EdgeInsets.only(top: 5.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    color: AllColors.lightBlueColor),
                                child: IconButton(
                                    icon: const Icon(Icons.arrow_back,
                                        color: AllColors.blackColor),
                                    onPressed: () {
                                      if (Navigator.canPop(context)) {
                                        Navigator.of(context).pop();
                                      } else {
                                        GoRouter.of(context).go('/dashboard');
                                      }
                                    }),
                              ),
                              iconTheme: IconThemeData(
                                  size: backSize, color: AllColors.blackColor),
                              expandedHeight: 250.0,
                              backgroundColor: AllColors.whiteColor,
                              flexibleSpace: Padding(
                                padding: EdgeInsets.all(padding),
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.circular(borderRadius),
                                  child: FlexibleSpaceBar(
                                    background: Image.network(
                                      alldetails.poster.toString(),
                                      filterQuality: FilterQuality.high,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ];
                        },
                        body: ListView(
                          children: [
                            EventOverview(
                              imageUrl: alldetails.poster.toString(),
                              eventHeading: alldetails.title.toString(),
                              location: alldetails.venue.toString(),
                              date: alldetails.eventDate
                                  .toString()
                                  .substring(0, 10),
                              // teamNo: alldetails.,
                              startDate: alldetails.registrationStartDate
                                  .toString()
                                  .substring(0, 10),
                              endDate: alldetails.registrationEndDate
                                  .toString()
                                  .substring(0, 10),
                            )
                          ],
                        )))
              ],
            );
          },
          error: (error, stackTrace) => Center(
                child: Text(
                  "Error: $error",
                  style: Textstyle.bodyLarge,
                ),
              ),
          loading: () => const Center(
                child: CircularProgressIndicator(color: AllColors.darkBlue),
              )),
    );
  }
}

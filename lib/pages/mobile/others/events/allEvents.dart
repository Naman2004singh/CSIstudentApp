import 'package:csi_app/pages/mobile/others/events/event_detail.dart';
import 'package:csi_app/providers/event_view_model.dart';
import 'package:csi_app/providers/item_providers.dart';
import 'package:csi_app/services/models/all_event.dart';
import 'package:csi_app/utils/colors.dart';
import 'package:csi_app/utils/constants.dart';
import 'package:csi_app/utils/styles.dart';
import 'package:csi_app/widgets/AppBar/appBar.dart';
import 'package:csi_app/widgets/AppBar/appdrawer.dart';
import 'package:csi_app/widgets/dashboard/knowmore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Allevents extends ConsumerWidget {
  const Allevents({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double padding = Constants.insidepadding;
    double smallborderRadius = Constants.smallradius;
    double width = Constants.screenWidth(context);
    final allEventitems = ref.watch(allEventProvider);
    final appBarViewModel = ref.watch(stateProvider);

    return Scaffold(
      backgroundColor: AllColors.whiteColor,
      appBar: Appbar(isDrawerOpen: appBarViewModel.isDraweOpen),
      drawer: const Appdrawer(),
      onDrawerChanged: (isOpen) {
        appBarViewModel.onDraweChange(isOpen);
      },
      body: allEventitems.when(
          data: (allEventitems) {
            List<AllEvent> userData = allEventitems.map((e) => e).toList();
            return Column(
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_back,
                          color: AllColors.blackColor,
                          size: 32,
                        )),
                    SizedBox(
                      width: width / 3.9,
                    ),
                    Text(
                      "Events",
                      style: Textstyle.headlineLarge,
                    )
                  ],
                ),
                Expanded(
                    child: ListView.builder(
                  itemCount: userData.length,
                  itemBuilder: (context, index) {
                    final alldata = userData[index];
                    return Padding(
                      padding: EdgeInsets.all(padding),
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(smallborderRadius),
                                border: Border.all(color: AllColors.darkBlue)),
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(smallborderRadius),
                              child: alldata.poster?.isNotEmpty == true
                                  ? Image.network(
                                      alldata.poster!,
                                      fit: BoxFit.cover,
                                      filterQuality: FilterQuality.high,
                                    )
                                  : Center(
                                      child: Text(
                                      alldata.status.toString(),
                                      style: Textstyle.headlineLarge,
                                    )),
                            ),
                          ),
                          Positioned(
                              right: 20,
                              top: 10,
                              child: CompleteStatus(
                                  text: alldata.status.toString())),
                          Positioned(
                              bottom: 20,
                              left: width / 2.7,
                              child: Knowmore(
                                onTap: () {
                                  ref.read(selectedEventId.notifier).state =
                                      alldata.id;
                                  // now navigate to the screen by passing the event id
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => const EventDetail()));
                                },
                              )),
                        ],
                      ),
                    );
                  },
                ))
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

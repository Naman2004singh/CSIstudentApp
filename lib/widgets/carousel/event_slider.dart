import 'package:carousel_slider/carousel_slider.dart';
import 'package:csi_app/providers/item_providers.dart';
import 'package:csi_app/services/models/all_event.dart';
import 'package:csi_app/utils/colors.dart';
import 'package:csi_app/utils/constants.dart';
import 'package:csi_app/providers/event_view_model.dart';
import 'package:csi_app/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:collection/collection.dart';
import 'package:go_router/go_router.dart';

class EventSlider extends ConsumerWidget {
  const EventSlider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(stateProvider);
    final allEvents = ref.watch(allEventProvider);
    final screenWidth = Constants.screenWidth(context);
    double borderRadius = Constants.borderRadius;
    double padding = Constants.insidepadding;
    const int maxItemToShow = 5;
    final CarouselSliderController carouselController =
        CarouselSliderController();
    return allEvents.when(
        data: (data) {
          List<AllEvent> allEventdata = data
              .where(
                (element) => element.id != null,
              )
              .sorted((a, b) => b.id!.compareTo(a.id!))
              .take(maxItemToShow)
              .toList();
          return Column(
            children: [
              Stack(
                children: [
                  CarouselSlider(
                      items: allEventdata
                          .map((item) => Padding(
                                padding: EdgeInsets.only(
                                    bottom: padding,
                                    left: padding,
                                    right: padding),
                                child: ConstrainedBox(
                                  constraints: BoxConstraints(
                                      maxHeight: 200, maxWidth: screenWidth),
                                  child: GestureDetector(
                                    onTap: () {
                                      ref.read(selectedEventId.notifier).state =
                                          item.id;
                                      GoRouter.of(context).go('/eventDetails');
                                    },
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(borderRadius),
                                      child: Image.network(
                                        item.poster.toString(),
                                        fit: BoxFit.cover,
                                        width: screenWidth,
                                        filterQuality: FilterQuality.high,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return Container(
                                            color: AllColors.mainColor,
                                            child: Center(
                                              child: Text(
                                                "Error in loading the event",
                                                style: Textstyle.bodyLargeWhite,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ))
                          .toList(),
                      carouselController: carouselController,
                      options: CarouselOptions(
                        scrollPhysics: const BouncingScrollPhysics(),
                        autoPlay: true,
                        aspectRatio: 2,
                        viewportFraction: 1,
                        onPageChanged: (index, reason) =>
                            provider.onPageChange(index, reason),
                      )),
                  Positioned(
                      bottom: 5,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: allEventdata.asMap().entries.map((entry) {
                          // print(entry);
                          // print(entry.key);
                          return GestureDetector(
                            onTap: () =>
                                carouselController.animateToPage(entry.key),
                            child: Container(
                              width:
                                  provider.currentIndex == entry.key ? 17 : 7,
                              height: 7.0,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 3.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: provider.currentIndex == entry.key
                                      ? AllColors.redColor
                                      : AllColors.darkBlue),
                            ),
                          );
                        }).toList(),
                      ))
                ],
              )
            ],
          );
        },
        error: (error, stackTrace) => Center(
              child: Text(
                "Error: $error",
                style: Textstyle.bodyLarge,
              ),
            ),
        loading: () => Container(
              margin: EdgeInsets.only(
                  bottom: padding, left: padding, right: padding),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
                color: AllColors.lightBlueColor,
              ),
              height: 200,
              child: const Center(
                child: CircularProgressIndicator(color: AllColors.darkBlue),
              ),
            ));
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:csi_app/utils/colors.dart';
import 'package:csi_app/utils/constants.dart';
import 'package:csi_app/providers/event_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EventSlider extends ConsumerWidget {
  const EventSlider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(stateProvider);
    final screenWidth = Constants.screenWidth(context);
    double borderRadius = Constants.borderRadius;
    double padding = Constants.insidepadding;
    final CarouselSliderController carouselController =
        CarouselSliderController();
    return Column(
      children: [
        Stack(
          children: [
            InkWell(
              child: CarouselSlider(
                  items: provider.eventList
                      .map((item) => Padding(
                            padding: EdgeInsets.only(
                                bottom: padding, left: padding, right: padding),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(borderRadius),
                              child: Image.asset(
                                item["event_image"],
                                fit: BoxFit.cover,
                                width: screenWidth,
                                filterQuality: FilterQuality.high,
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
            ),
            Positioned(
                bottom: 5,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: provider.eventList.asMap().entries.map((entry) {
                    // print(entry);
                    // print(entry.key);
                    return GestureDetector(
                      onTap: () => carouselController.animateToPage(entry.key),
                      child: Container(
                        width: provider.currentIndex == entry.key ? 17 : 7,
                        height: 7.0,
                        margin: const EdgeInsets.symmetric(horizontal: 3.0),
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
  }
}

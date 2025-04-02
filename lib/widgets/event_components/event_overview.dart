import 'package:csi_app/utils/colors.dart';
import 'package:csi_app/utils/constants.dart';
import 'package:csi_app/utils/styles.dart';
import 'package:flutter/material.dart';

class EventOverview extends StatelessWidget {
  final String imageUrl;
  final String eventHeading;
  final date;
  final startDate;
  final endDate;
  final location;
  final teamNo;
  const EventOverview({
    super.key,
    required this.imageUrl,
    required this.eventHeading,
    this.date,
    this.location,
    this.teamNo,
    this.startDate,
    this.endDate,
  });

  @override
  Widget build(BuildContext context) {
    double borderRadius = Constants.smallradius;
    double padding = Constants.insidepadding;
    double sizedBox = Constants.sizedBoxHeight;
    double smallsized = Constants.smallSizedBox;
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Column(
        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(borderRadius),
                child: Image.network(
                  width: 115,
                  height: 115,
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: sizedBox,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    eventHeading,
                    style: Textstyle.headlineSmall,
                  ),
                  SizedBox(
                    height: smallsized,
                  ),
                  SmallDetails(
                    iconData: Icons.calendar_month_outlined,
                    details: date ?? "  -  ",
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  SmallDetails(
                    iconData: Icons.location_on_outlined,
                    details: location ?? "  -  ",
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  SmallDetails(
                    iconData: Icons.person_2_outlined,
                    details: teamNo ?? "   -   ",
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: sizedBox,
          ),
          Container(
              padding: EdgeInsets.all(smallsized),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(borderRadius),
                  color: AllColors.whiteColor),
              child: Row(
                children: [
                  Text(
                    "Registrations open from ",
                    style: Textstyle.bodySmall,
                  ),
                  Container(
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                        color: AllColors.lightBlueColor,
                        borderRadius: BorderRadius.circular(smallsized)),
                    child: Text(
                      startDate ?? "  -  ",
                      style: Textstyle.bodySmall,
                    ),
                  ),
                  Text(
                    " till ",
                    style: Textstyle.bodySmall,
                  ),
                  Container(
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                        color: AllColors.lightBlueColor,
                        borderRadius: BorderRadius.circular(smallsized)),
                    child: Text(
                      endDate ?? "  -  ",
                      style: Textstyle.bodySmall,
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}

// for the detail of the event
class SmallDetails extends StatelessWidget {
  final IconData iconData;
  final details;
  const SmallDetails({super.key, required this.iconData, this.details});

  @override
  Widget build(BuildContext context) {
    double smallsize = Constants.smallSizedBox;
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          iconData,
          color: AllColors.darkBlue,
        ),
        SizedBox(
          width: smallsize,
        ),
        Text(
          details,
          style: Textstyle.bodySmallgrey,
        )
      ],
    );
  }
}

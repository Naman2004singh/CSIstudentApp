import 'package:csi_app/utils/colors.dart';
import 'package:csi_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class EventPoster extends StatelessWidget {
  final String poster;
  const EventPoster({super.key, required this.poster});

  @override
  Widget build(BuildContext context) {
    double iconSize = Constants.backButtonSize;
    return Scaffold(
      backgroundColor: AllColors.blackColor,
      appBar: AppBar(
        backgroundColor: AllColors.blackColor,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.close,
              size: iconSize,
              color: AllColors.whiteColor,
            )),
      ),
      body: Center(
        child: Hero(
            tag: 'full image',
            child: PhotoView(
              imageProvider: NetworkImage(poster.toString()),
              maxScale: PhotoViewComputedScale.covered,
              minScale: PhotoViewComputedScale.contained,
            )),
      ),
    );
  }
}

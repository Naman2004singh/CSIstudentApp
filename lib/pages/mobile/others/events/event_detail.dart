import 'package:csi_app/providers/item_providers.dart';
import 'package:csi_app/services/models/event_details_model.dart';
import 'package:csi_app/utils/colors.dart';
import 'package:csi_app/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EventDetail extends ConsumerWidget {
  const EventDetail({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allEventdetail = ref.watch(eventDetailProvider);
    return Scaffold(
      appBar: AppBar(),
      body: allEventdetail.when(
        data: (data) {
          EventDetails alldetails = data;
          return Column(
            children: [
              Expanded(
                child: Container(
                  child: Image.network(alldetails.poster.toString()),
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
              ) ),
    );
  }
}
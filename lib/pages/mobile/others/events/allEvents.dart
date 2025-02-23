import 'package:csi_app/providers/item_providers.dart';
import 'package:csi_app/utils/colors.dart';
import 'package:csi_app/utils/constants.dart';
import 'package:csi_app/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Allevents extends ConsumerWidget {
  const Allevents({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double padding = Constants.insidepadding;
    double borderRadius = Constants.borderRadius;
    final allEventitems = ref.watch(allEventProvider);

    return Scaffold(
      body: allEventitems.when(
          data: (data) {
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final alldata = data[index];
                return Padding(
                  padding: EdgeInsets.all(padding),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(borderRadius),
                    child: alldata.mediaFiles?.isNotEmpty == true
                    ? Image.network(alldata.mediaFiles!.first)
                    : Center(child: Text(alldata.title.toString(),style: Textstyle.headlineLarge,)),
                  ),
                );
              },
            );
          },
          error: (error, stackTrace) => Center(
                child: Text("Error: $error"),
              ),
          loading: () => const Center(
                child: CircularProgressIndicator(color: AllColors.darkBlue),
              )),
    );
  }
}

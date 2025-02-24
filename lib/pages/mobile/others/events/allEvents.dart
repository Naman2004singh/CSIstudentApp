import 'package:csi_app/providers/item_providers.dart';
import 'package:csi_app/services/models/all_event.dart';
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
      appBar: AppBar(
        title: Text("API"),
      ),
      body: allEventitems.when(
          data: (allEventitems) {
            List<AllEvent> userData = allEventitems.map((e) => e).toList();
            return Column(
              children: [
                Expanded(child: ListView.builder(
              itemCount: userData.length,
              itemBuilder: (context, index) {
                final alldata = userData[index];
                return Padding(
                  padding: EdgeInsets.all(padding),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(borderRadius),
                    child: alldata.poster?.isNotEmpty == true
                        ? Image.network(alldata.poster!)
                        : Center(
                            child: Text(
                            alldata.status.toString(),
                            style: Textstyle.headlineLarge,
                          )),
                  ),
                );
              },
            ))
              ],
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

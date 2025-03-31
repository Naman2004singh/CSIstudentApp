import 'package:csi_app/providers/event_view_model.dart';
import 'package:csi_app/providers/item_providers.dart';
import 'package:csi_app/services/models/event_details_model.dart';
import 'package:csi_app/utils/colors.dart';
import 'package:csi_app/utils/constants.dart';
import 'package:csi_app/utils/styles.dart';
import 'package:csi_app/widgets/AppBar/appBar.dart';
import 'package:csi_app/widgets/AppBar/appdrawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class EventDetail extends ConsumerWidget {
  const EventDetail({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appBarViewModel = ref.watch(stateProvider);
    double backSize = Constants.backButtonSize;

    final allEventdetail = ref.watch(eventDetailProvider);
    return Scaffold(
      backgroundColor: AllColors.whiteColor,
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
                              leading: IconButton(
                                  icon: const Icon(Icons.arrow_back,
                                      color: AllColors.blackColor),
                                  onPressed: () {
                                    if (Navigator.canPop(context)) {
                                      Navigator.of(context).pop();
                                    } else {
                                      GoRouter.of(context).go('/dashboard');
                                    }
                                  }),
                              iconTheme: IconThemeData(
                                  size: backSize, color: AllColors.blackColor),
                              expandedHeight: 300.0,
                              backgroundColor: AllColors.whiteColor,
                              flexibleSpace: FlexibleSpaceBar(
                                background: Image.network(
                                  alldetails.poster.toString(),
                                  filterQuality: FilterQuality.high,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            )
                          ];
                        },
                        body: ListView()))
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

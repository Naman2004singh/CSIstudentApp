import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

final stateProvider = ChangeNotifierProvider.autoDispose<EventViewModel>(
    (ref) => EventViewModel());

class EventViewModel with ChangeNotifier {
  int currentIndex = 0;
  bool isDraweopen = false;

  // List eventList = [
  //   {"id": 1, "event_image": "assets/images/event1.png"},
  //   {"id": 2, "event_image": "assets/images/event2.png"},
  //   {"id": 3, "event_image": "assets/images/event3.png"},
  // ];

  onPageChange(index, reason) {
    currentIndex = index;
    notifyListeners();
  }
  // for drawer option
  bool get isDraweOpen => isDraweopen;
  void onDraweChange(bool isOpen) {
    isDraweopen = isOpen;
    notifyListeners();
  }
}

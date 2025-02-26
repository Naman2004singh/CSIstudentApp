import 'package:csi_app/services/functions/event_api.dart';
import 'package:csi_app/services/functions/event_detail_api.dart';
import 'package:csi_app/services/models/all_event.dart';
import 'package:csi_app/services/models/event_details_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiServiceProvider = Provider<EventApi>((ref) => EventApi());
final eventDetailServiceProvider =
    Provider<EventDetailApi>((ref) => EventDetailApi());

// provider to fetch item
final allEventProvider = FutureProvider<List<AllEvent>>((ref) async {
  return ref.watch(apiServiceProvider).fetchItems();
});

// for selecting the event id globally
final selectedEventId = StateProvider<int?>((ref) => null);

// for other api call and use of event id
final eventDetailProvider =
    FutureProvider<EventDetails>((ref) async {
  final eventId = ref.watch(selectedEventId);
  final apiService = ref.read(eventDetailServiceProvider);

  // assert(eventId.)
  return apiService.fetchDetails(eventId);
});

//     FutureProvider.autoDispose<List<AllEvent>>((ref) async {
//   final apiService = ref.read(apiServiceProvider);
//   return apiService.fetchItems();
// });

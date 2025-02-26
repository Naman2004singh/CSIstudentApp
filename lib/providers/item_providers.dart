import 'package:csi_app/services/functions/event_api.dart';
import 'package:csi_app/services/models/all_event.dart';
import 'package:csi_app/services/models/event_details_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiServiceProvider = Provider<EventApi>((ref) => EventApi());
// final eventDetailServiceProvider = Provider<EventDetails>((ref) =>);

// provider to fetch item
final allEventProvider = FutureProvider<List<AllEvent>>((ref) async {
  return ref.watch(apiServiceProvider).fetchItems();
});

// for selecting the event id globally
final selectedEventId = StateProvider<int?>((ref) => null);

// for other api call and use of event id
// final eventDetailProvider = FutureProvider

//     FutureProvider.autoDispose<List<AllEvent>>((ref) async {
//   final apiService = ref.read(apiServiceProvider);
//   return apiService.fetchItems();
// });

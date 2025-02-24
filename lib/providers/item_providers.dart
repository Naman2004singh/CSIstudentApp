import 'package:csi_app/services/functions/event_api.dart';
import 'package:csi_app/services/models/all_event.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiServiceProvider = Provider<EventApi>((ref) => EventApi());

// provider to fetch item
final allEventProvider = FutureProvider<List<AllEvent>>((ref) async {
  return ref.watch(apiServiceProvider).fetchItems();
});
//     FutureProvider.autoDispose<List<AllEvent>>((ref) async {
//   final apiService = ref.read(apiServiceProvider);
//   return apiService.fetchItems();
// });

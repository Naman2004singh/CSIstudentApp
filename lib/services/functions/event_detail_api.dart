import 'dart:convert';
import 'package:csi_app/services/models/event_details_model.dart';
import 'package:http/http.dart' as http;

const String baseUrl = "https://csi-backend-wvn0.onrender.com/api";

class EventDetailApi {
  Future<EventDetails> fetchDetails(int? eventId) async {
    http.Response response =
        await http.get(Uri.parse("$baseUrl/event/detail/$eventId/"), headers: {
      'Content-Type': 'application/json',
    });
    // print(response.body);
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return EventDetails.fromJson(data);
    } else {
      throw Exception("Failed to load items");
    }
  }
}

import 'dart:convert';
import 'package:csi_app/services/models/all_event.dart';
import 'package:http/http.dart' as http;

const String baseUrl = "https://csi-backend-wvn0.onrender.com/api";

class EventApi {
  Future<List<AllEvent>> fetchItems() async {
    http.Response response = await http
        .get(Uri.parse("$baseUrl/event/event-for-homepage/"), headers: {
      'Content-Type': 'application/json',
    });
    // print("Response Status Code: ${response.statusCode}");
    // print("Response Body: ${response.body}");
    // print("$baseUrl/event/list/");
    // print(response);
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((e) => AllEvent.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load items");
    }
  }
}

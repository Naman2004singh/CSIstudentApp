import 'dart:convert';

import 'package:csi_app/services/models/all_event.dart';
import 'package:http/http.dart' as http;

const String baseUrl = "https://csi-backend-wvn0.onrender.com/api";

class EventApi {
  Future<List<AllEvent>> fetchItems() async {
    final response =
        await http.get(Uri.parse("$baseUrl/event/list/"), headers: {
      'Content-Type': 'application/json',
    });
    print("$baseUrl/event/list/");
    print(response);
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => AllEvent.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load items");
    }
  }
}

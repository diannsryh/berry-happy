import 'dart:convert';
import 'package:berry_happy/dto/menu.dart';
import 'package:berry_happy/endpoints/endpoints.dart';
import 'package:http/http.dart' as http;

class DataService {
  static Future<List<Menu>> fetchMenu() async {
    final response = await http.get(Uri.parse(Endpoints.menu));
    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((item) => Menu.fromJson(item)).toList();
    } else {
      //handle error
      throw Exception('Failed to load news');
    }
  }
}

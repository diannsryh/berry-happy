import 'dart:convert';
import 'package:berry_happy/dto/menu.dart';
import 'package:berry_happy/endpoints/endpoints.dart';
import 'package:http/http.dart' as http;

class DataService {
  // static Future<List<Menu>> fetchMenu() async {
  //   final response = await http.get(Uri.parse(Endpoints.menu));
  //   if (response.statusCode == 200) {
  //     final List<dynamic> jsonResponse = jsonDecode(response.body);
  //     return jsonResponse.map((item) => Menu.fromJson(item)).toList();
  //   } else {
  //     //handle error
  //     throw Exception('Failed to load news');
  //   }
  // }

  // static Future<List<Menu>> fetchMenu() async {
  //   final response = await http.get(Uri.parse(Endpoints.menu));

  //   if (response.statusCode == 200) {
  //     // Parse the JSON
  //     final List<dynamic> jsonList = jsonDecode(response.body) as List<dynamic>;

  //     // Map the JSON to a list of Menu objects
  //     return jsonList
  //         .map((json) => Menu.fromJson(json as Map<String, dynamic>))
  //         .toList();
  //   } else {
  //     throw Exception('Failed to load menu');
  //   }
  // }
  static Future<List<Menu>> fetchMenu() async {
    final response = await http.get(Uri.parse(Endpoints.menuRead));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      return (data['datas'] as List<dynamic>)
          .map((item) => Menu.fromJson(item as Map<String, dynamic>))
          .toList();
    } else {
      // Handle error
      throw Exception('Failed to load data ${response.statusCode}');
    }
  }
}

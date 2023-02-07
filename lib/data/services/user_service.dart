import 'dart:convert';

import 'package:belajar_parsing_json/data/models/contact_support_model.dart';
import 'package:belajar_parsing_json/data/models/user_model.dart';
import "package:http/http.dart" as http;

class UserService {
  static String baseUrl = "https://reqres.in/api";
  static Future<List<User>> fetchData() async {
    try {
      var url = Uri.parse("$baseUrl/users?page=2");
      var response = await http.get(
        url,
        headers: {
          "Content-Type": "application/json",
        },
      );
      final body = response.body;

      final result = jsonDecode(body);
      List<User> users = List<User>.from(
        result['data'].map(
          (user) => User.fromJson(user),
        ),
      );
      return users;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<ContactSupport> fetchContactSupport() async {
    try {
      Uri url = Uri.parse('$baseUrl/unknown/2');
      var response = await http.get(
        url,
        headers: {
          "Content-Type": "application/json",
        },
      );
      final body = response.body;
      final result = jsonDecode(body);
      ContactSupport contactSupport = ContactSupport.fromJson(result);
      return contactSupport;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

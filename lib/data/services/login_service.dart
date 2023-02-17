import 'dart:convert';

import 'package:belajar_parsing_json/data/models/login_model.dart';
import 'package:dartz/dartz.dart';
import "package:http/http.dart" as http;

typedef EitherLogin = Future<Either<Login, Failure>>;

class LoginService {
  static EitherLogin loginService(String email, String password) async {
    try {
      var response = await http.post(
        Uri.parse("https://reqres.in/api/login"),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
      );
      if (response.statusCode == 200) {
        var obj = jsonDecode(response.body);

        return left(Login.fromJson(obj));
      } else {
        return right(Failure(message: "Gagal Login"));
      }
    } catch (e) {
      return right(Failure(message: "Gagal Login"));
    }
  }
}

class Failure {
  String? message;
  Failure({this.message});
}

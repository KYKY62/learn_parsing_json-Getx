import 'package:belajar_parsing_json/view/login/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final loginC = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Dashboard"),
          actions: const [],
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.only(),
              child: TextFormField(
                controller: loginC.usernameController,
                maxLength: 20,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  labelStyle: TextStyle(
                    color: Colors.blueGrey,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                    ),
                  ),
                  helperText: "What's your name?",
                ),
                onChanged: (value) {},
              ),
            ),
            Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.only(),
              child: TextFormField(
                controller: loginC.passwordController,
                maxLength: 20,
                // obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    color: Colors.blueGrey,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
                onChanged: (value) {},
              ),
            ),
            ElevatedButton(
              onPressed: () {
                loginC.login();
              },
              child: const Text("Login"),
            ),
            Obx(() => Text(loginC.logindata.value.token ?? ''))
          ],
        ));
  }
}

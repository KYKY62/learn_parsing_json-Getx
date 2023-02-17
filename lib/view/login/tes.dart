import 'package:belajar_parsing_json/view/login/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Tes extends StatelessWidget {
  Tes({super.key});
  final loginC = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Berhasil?"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Obx(() => Text(loginC.logindata.value.token ?? '')),
            ],
          ),
        ),
      ),
    );
  }
}

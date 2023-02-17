import 'package:belajar_parsing_json/data/models/login_model.dart';
import 'package:belajar_parsing_json/data/services/login_service.dart';
import 'package:belajar_parsing_json/view/login/tes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var logindata = Login().obs;

  Future login() async {
    final data = await LoginService.loginService(
      usernameController.text,
      passwordController.text,
    );
    data.fold((l) async {
      logindata.value = l;
      await Get.defaultDialog(
          title: "Berhasil Login", middleText: "User has Found");
      Get.to(() => Tes());
    }, (r) async {
      await Get.defaultDialog(
          title: "Gagal Login", middleText: "User Not Found");
    });
  }
}

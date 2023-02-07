import 'package:belajar_parsing_json/data/models/contact_support_model.dart';
import 'package:belajar_parsing_json/data/models/user_model.dart';
import 'package:belajar_parsing_json/data/services/user_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    fetchData();
    fetchContactSupport();
  }

  var user = <User>[].obs;
  Future<List<User>> fetchData() async {
    final result = await UserService.fetchData();
    return user.value = result;
  }

  ContactSupport? contactSupport;
  Future fetchContactSupport() async {
    final result = await UserService.fetchContactSupport();
    return contactSupport = result;
  }
}

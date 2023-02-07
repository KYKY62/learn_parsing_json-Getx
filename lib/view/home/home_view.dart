import 'package:belajar_parsing_json/data/models/user_model.dart';
import 'package:belajar_parsing_json/view/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final homeC = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Belajar parsing JSON"),
          centerTitle: true,
        ),
        body: FutureBuilder<List<User>>(
          future: homeC.fetchData(),
          builder: (context, snapshot) {
            return Obx(
              () => ListView.builder(
                itemCount: homeC.user.length,
                itemBuilder: (context, index) {
                  final user = homeC.user[index];
                  return Center(
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(user.avatar),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("${user.id}"),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(user.email),
                          ],
                        ),
                        Text("${user.firstName} ${user.lastName}"),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Text(homeC.contactSupport!.support.url),
                        const SizedBox(
                          height: 15.0,
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        ));
  }
}

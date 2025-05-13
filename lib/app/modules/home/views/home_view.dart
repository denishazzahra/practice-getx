import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
        centerTitle: true,
      ),
      body: Obx(
        () {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed('/create-user')?.then((result) {
                        if (result == true) {
                          controller.setup();
                        }
                      });
                    },
                    child: const Text('Create New User'),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.userList.length,
                    itemBuilder: (context, index) {
                      final user = controller.userList[index];
                      return ListTile(
                        onTap: () {},
                        title: Text(user.name!),
                        subtitle: Text('${user.email!} | ${user.gender!}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.edit),
                              color: Colors.blue,
                              visualDensity: VisualDensity.compact,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.delete_outline),
                              color: Colors.red,
                              visualDensity: VisualDensity.compact,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../controllers/home_controller.dart';

Widget createUserButton(HomeController controller) {
  return ElevatedButton(
    onPressed: () {
      Get.toNamed('/create-user')?.then((result) {
        if (result == true) {
          controller.setup();
        }
      });
    },
    child: const Text('Create New User'),
  );
}

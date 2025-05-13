import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/models/user_model.dart';
import '../../controllers/home_controller.dart';
import 'delete_dialog.dart';

Widget userActions(UserModel user) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      IconButton(
        onPressed: () {
          Get.toNamed('/update-user/${user.id}')?.then((result) {
            if (result == true) {
              Get.find<HomeController>().setup();
            }
          });
        },
        icon: const Icon(Icons.edit),
        color: Colors.blue,
        visualDensity: VisualDensity.compact,
      ),
      IconButton(
        onPressed: () {
          deleteDialog(user.id!);
        },
        icon: const Icon(Icons.delete_outline),
        color: Colors.red,
        visualDensity: VisualDensity.compact,
      ),
    ],
  );
}

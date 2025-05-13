import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/home_controller.dart';

Future<dynamic> deleteDialog(int id) {
  return Get.defaultDialog(
    title: "Delete User",
    content: Text("Are you sure you want to delete this user?"),
    confirm: TextButton(
      onPressed: () {
        Get.find<HomeController>().deleteUser(id);
        Get.back();
      },
      child: const Text(
        "Delete",
        style: TextStyle(color: Colors.red),
      ),
    ),
    cancel: TextButton(
      onPressed: () {
        Get.back();
      },
      child: const Text(
        "Cancel",
        style: TextStyle(color: Colors.grey),
      ),
    ),
  );
}

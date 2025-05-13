import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../controllers/home_controller.dart';
import 'user_list_item.dart';

Widget userList(HomeController controller) {
  return Obx(() {
    if (controller.isLoading.value) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return ListView.builder(
        itemCount: controller.userList.length,
        itemBuilder: (context, index) {
          final user = controller.userList[index];
          return userListItem(user);
        },
      );
    }
  });
}

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:practice_getx/core/service/user_service.dart';

import '../../../data/models/user_model.dart';

class CreateUserController extends GetxController {
  final List<String> genders = ['Male', 'Female'];
  Rx<UserModel> user = UserModel().obs;
  Rx<TextEditingController> name = TextEditingController().obs;
  Rx<TextEditingController> email = TextEditingController().obs;

  void setGender(String gender) {
    user.update((val) {
      val?.gender = gender;
    });
  }

  void setName(String name) {
    user.update((val) {
      val?.name = name.trim();
    });
  }

  void setEmail(String email) {
    user.update((val) {
      val?.email = email.trim();
    });
  }

  void createUser() async {
    try {
      final response = await UserService.createUser(user.value);
      if (response['status'] == 'Success') {
        Get.back(result: true);
        Get.snackbar('Success', 'User created successfully');
      } else if (response.containsKey('message')) {
        throw Exception(response['message']);
      } else {
        throw Exception('Failed to create user');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}

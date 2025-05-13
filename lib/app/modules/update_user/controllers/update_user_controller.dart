import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../core/service/user_service.dart';
import '../../../data/models/user_model.dart';

class UpdateUserController extends GetxController {
  Rx<UserModel> user = UserModel().obs;
  int? id = int.tryParse(Get.parameters['id'] ?? '-1');
  RxBool isLoading = true.obs;
  Rx<TextEditingController> name = TextEditingController().obs;
  Rx<TextEditingController> email = TextEditingController().obs;
  final List<String> genders = ['Male', 'Female'];

  @override
  void onInit() {
    super.onInit();
    setup();
  }

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

  void setup() async {
    try {
      isLoading.value = true;
      if (id != -1) {
        final response = await UserService.getUserById(id!);
        if (response.containsKey('data')) {
          user.value = UserModel.fromJson(response['data']);
          user.update((val) {
            val?.id = id;
          });
          name.value.text = user.value.name!;
          email.value.text = user.value.email!;
        } else {
          throw Exception('Failed to load user');
        }
      } else {
        Get.back();
        Get.snackbar('Error', 'Invalid user ID');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void updateUser() async {
    try {
      final response = await UserService.updateUser(user.value);
      if (response['status'] == 'Success') {
        Get.back(result: true);
        Get.snackbar('Success', 'User updated successfully');
      } else if (response.containsKey('message')) {
        throw Exception(response['message']);
      } else {
        throw Exception('Failed to update user');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}

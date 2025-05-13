import 'package:get/get.dart';

import '../../../../core/service/user_service.dart';
import '../../../data/models/user_model.dart';

class HomeController extends GetxController {
  RxList<UserModel> userList = <UserModel>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    setup();
  }

  void setup() async {
    try {
      isLoading.value = true;
      final response = await UserService.getAllUsers();
      if (response.containsKey('data')) {
        userList.value = (response['data'] as List)
            .map((user) => UserModel.fromJson(user))
            .toList();
      } else {
        throw Exception('Failed to load users');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to load users');
    } finally {
      isLoading.value = false;
    }
  }
}

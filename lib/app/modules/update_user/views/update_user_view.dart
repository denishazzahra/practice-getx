import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../core/widget/user_form.dart';
import '../controllers/update_user_controller.dart';

class UpdateUserView extends GetView<UpdateUserController> {
  const UpdateUserView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update User'),
        centerTitle: true,
      ),
      body: userForm(controller, 'Update'),
    );
  }
}

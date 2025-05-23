import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../core/widget/user_form.dart';
import '../controllers/create_user_controller.dart';

class CreateUserView extends GetView<CreateUserController> {
  const CreateUserView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New User'),
        centerTitle: true,
      ),
      body: userForm(controller, 'Create'),
    );
  }
}

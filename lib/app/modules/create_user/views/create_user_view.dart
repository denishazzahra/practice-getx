import 'package:flutter/material.dart';

import 'package:get/get.dart';

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
        body: _userForm());
  }

  Widget _userForm() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            TextFormField(
              onChanged: (value) => controller.setName(value),
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12),
            TextFormField(
              onChanged: (value) => controller.setEmail(value),
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade600),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Obx(() {
                return DropdownButton<String>(
                  value: controller.user.value.gender,
                  items: controller.genders
                      .map((gender) => DropdownMenuItem(
                            value: gender,
                            child: Text(gender),
                          ))
                      .toList(),
                  onChanged: (value) => controller.setGender(value!),
                  isExpanded: true,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  hint: Text('--- Select gender ---'),
                  underline: SizedBox(),
                );
              }),
            ),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                controller.createUser();
              },
              child: const Text('Create User'),
            ),
          ],
        ),
      ),
    );
  }
}

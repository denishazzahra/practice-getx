import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

Widget userForm(dynamic controller, String mode) {
  return Center(
    child: Padding(
      padding: EdgeInsets.all(16),
      child: ListView(
        children: [
          TextFormField(
            controller: controller.name.value,
            onChanged: (value) => controller.setName(value),
            decoration: const InputDecoration(
              labelText: 'Name',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 12),
          TextFormField(
            controller: controller.email.value,
            onChanged: (value) => controller.setEmail(value),
            decoration: const InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 12),
          Obx(() {
            return DropdownButtonFormField<String>(
              value: controller.user.value.gender,
              items: <DropdownMenuItem<String>>[
                ...controller.genders.map((String gender) => DropdownMenuItem(
                      value: gender,
                      child: Text(gender),
                    ))
              ],
              onChanged: (value) => controller.setGender(value!),
              isExpanded: true,
              hint: Text('--- Select gender ---'),
              decoration: const InputDecoration(border: OutlineInputBorder()),
            );
          }),
          SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {
              if (mode == 'Update') {
                controller.updateUser();
              } else {
                controller.createUser();
              }
            },
            child: Text('$mode User'),
          ),
        ],
      ),
    ),
  );
}

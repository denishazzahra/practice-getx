import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'core/theme/custom_theme.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      theme: CustomTheme.lightTheme,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}

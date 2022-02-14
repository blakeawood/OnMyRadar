import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:on_my_radar/utils/theme.dart';

showGetxSnackbar({required title, required message}) {
  Get.snackbar(
    title,
    message,
    colorText: Colors.white,
    backgroundColor: const Color(0xFF000000),
    snackPosition: SnackPosition.BOTTOM,
    snackStyle: SnackStyle.FLOATING,
    isDismissible: true,
    duration: const Duration(seconds: 3),
    icon: const Icon(Icons.info_outline, color: Colors.white),
    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
    borderRadius: 10,
  );
}

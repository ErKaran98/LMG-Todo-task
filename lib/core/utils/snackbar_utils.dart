import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackbarUtils {
  static void showError(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.red.shade600,
      colorText: Colors.white,
      margin: const EdgeInsets.all(12),
      borderRadius: 12,
      icon: const Icon(
        Icons.error_outline,
        color: Colors.white,
      ),
      duration: const Duration(seconds: 2),
    );
  }

  static void showSuccess(String message) {
    Get.snackbar(
      'Success',
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.green.shade600,
      colorText: Colors.white,
      margin: const EdgeInsets.all(12),
      borderRadius: 12,
      icon: const Icon(
        Icons.check_circle_outline,
        color: Colors.white,
      ),
      duration: const Duration(seconds: 2),
    );
  }
}
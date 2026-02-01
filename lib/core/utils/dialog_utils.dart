import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogUtils {
  static Future<void> showDeleteConfirmation({
    required VoidCallback onConfirm,
  }) async {
    await Get.dialog(
      AlertDialog(
        title: const Text('Delete Todo'),
        content: const Text(
          'Are you sure you want to delete this todo?',
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              Get.back();
              onConfirm();
            },
            child: const Text('Delete'),
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }
}
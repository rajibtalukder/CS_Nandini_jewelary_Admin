import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nondini_jewellery_admin/utils/colors.dart';

class Utils {
  static final apiHeader = {
    'Access-Control-Allow-Origin': '*',
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    //'Authorization': 'Bearer $token',
    //'Accept': '*/*'
  };

  static void showLoading([String? message]) {
    Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 8),
              Text(message ?? 'Loading...'),
            ],
          ),
        ),
      ),
    );
  }

  static void hidePopup() {
    Get.back();
  }

  static void showSnackBar(String message) {
    Get.snackbar(
      "Information!",
      message,
      icon: Icon(Icons.error, color: Colors.white),
      backgroundColor: AppColors.primaryColor,
      borderRadius: 20,
      colorText: Colors.white,
      duration: Duration(seconds: 3),
      isDismissible: true,
    );
  }
}

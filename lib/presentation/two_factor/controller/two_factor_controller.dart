import 'package:get/get.dart';
import 'package:flutter/material.dart';

class TwoFactorController extends GetxController {
  TextEditingController otpFieldController = TextEditingController();

  void onTapVerifyOtpButton() {
    // Add your OTP verification logic here
  }

  @override
  void onClose() {
    otpFieldController.dispose();
    super.onClose();
  }
}

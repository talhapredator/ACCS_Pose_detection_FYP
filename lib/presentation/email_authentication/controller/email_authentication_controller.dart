import 'package:get/get.dart';
import 'package:flutter/material.dart';

class EmailAuthenticationController extends GetxController {
  TextEditingController emailFieldController = TextEditingController();
  TextEditingController otpFieldController = TextEditingController();

  void onTapAuthenticateEmailButton() {
    // Add your email authentication logic here
  }

  void onTapVerifyOtpButton() {
    // Add your OTP verification logic here
  }

  @override
  void onClose() {
    emailFieldController.dispose();
    otpFieldController.dispose();
    super.onClose();
  }
}

import 'package:talha_s_application_demo/core/app_export.dart';
import 'package:talha_s_application_demo/presentation/iphone_14_15_pro_max_one_screen/models/iphone_14_15_pro_max_one_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the Iphone1415ProMaxOneScreen.
///
/// This class manages the state of the Iphone1415ProMaxOneScreen, including the
/// current iphone1415ProMaxOneModelObj
class Iphone1415ProMaxOneController extends GetxController {
  TextEditingController usernameFieldController = TextEditingController();

  TextEditingController passwordFieldController = TextEditingController();

  Rx<Iphone1415ProMaxOneModel> iphone1415ProMaxOneModelObj =
      Iphone1415ProMaxOneModel().obs;

  @override
  void onClose() {
    super.onClose();
    usernameFieldController.dispose();
    passwordFieldController.dispose();
  }
}

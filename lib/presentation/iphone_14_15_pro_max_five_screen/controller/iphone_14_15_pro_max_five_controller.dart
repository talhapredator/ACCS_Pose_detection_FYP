import 'package:talha_s_application_demo/core/app_export.dart';
import 'package:talha_s_application_demo/presentation/iphone_14_15_pro_max_five_screen/models/iphone_14_15_pro_max_five_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the Iphone1415ProMaxFiveScreen.
///
/// This class manages the state of the Iphone1415ProMaxFiveScreen, including the
/// current iphone1415ProMaxFiveModelObj
class Iphone1415ProMaxFiveController extends GetxController {
  TextEditingController firstNameSectionController = TextEditingController();

  TextEditingController lastNameSectionController = TextEditingController();

  TextEditingController passwordSectionController = TextEditingController();

  TextEditingController confirmPasswordSectionController =
      TextEditingController();

  TextEditingController userNameSectionController = TextEditingController();

  Rx<Iphone1415ProMaxFiveModel> iphone1415ProMaxFiveModelObj =
      Iphone1415ProMaxFiveModel().obs;

  @override
  void onClose() {
    super.onClose();
    firstNameSectionController.dispose();
    lastNameSectionController.dispose();
    passwordSectionController.dispose();
    confirmPasswordSectionController.dispose();
    userNameSectionController.dispose();
  }
}

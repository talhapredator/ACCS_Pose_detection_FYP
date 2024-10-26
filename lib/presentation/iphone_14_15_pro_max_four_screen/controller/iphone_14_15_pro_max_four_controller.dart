import 'package:talha_s_application_demo/core/app_export.dart';
import 'package:talha_s_application_demo/presentation/iphone_14_15_pro_max_four_screen/models/iphone_14_15_pro_max_four_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the Iphone1415ProMaxFourScreen.
///
/// This class manages the state of the Iphone1415ProMaxFourScreen, including the
/// current iphone1415ProMaxFourModelObj
class Iphone1415ProMaxFourController extends GetxController {
  TextEditingController seventyFourController = TextEditingController();

  TextEditingController seventyFiveController = TextEditingController();

  TextEditingController seventySixController = TextEditingController();

  TextEditingController seventySevenController = TextEditingController();

  TextEditingController thirtyThreeController = TextEditingController();

  Rx<Iphone1415ProMaxFourModel> iphone1415ProMaxFourModelObj =
      Iphone1415ProMaxFourModel().obs;

  @override
  void onClose() {
    super.onClose();
    seventyFourController.dispose();
    seventyFiveController.dispose();
    seventySixController.dispose();
    seventySevenController.dispose();
    thirtyThreeController.dispose();
  }
}

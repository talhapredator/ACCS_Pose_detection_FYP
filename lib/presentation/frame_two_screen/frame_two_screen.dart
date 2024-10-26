import 'controller/frame_two_controller.dart';
import 'package:flutter/material.dart';
import 'package:talha_s_application_demo/core/app_export.dart';
import 'package:talha_s_application_demo/widgets/custom_elevated_button.dart';

class FrameTwoScreen extends GetWidget<FrameTwoController> {
  const FrameTwoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: 739.h,
                padding: EdgeInsets.symmetric(horizontal: 36.h, vertical: 28.v),
                child: Column(children: [
                  CustomElevatedButton(
                      height: 50.v,
                      width: 160.h,
                      text: "lbl_controls".tr,
                      buttonStyle: CustomButtonStyles.fillLightGreen,
                      onPressed: () {
                        onTapControls();
                      },
                      alignment: Alignment.centerRight),
                  SizedBox(height: 79.v),
                  Text("lbl_connected2".tr,
                      style: CustomTextStyles.headlineSmallRedA700),
                  SizedBox(height: 5.v)
                ]))));
  }

  /// Navigates to the iphone1415ProMaxThreeScreen when the action is triggered.
  onTapControls() {
    Get.toNamed(
      AppRoutes.iphone1415ProMaxThreeScreen,
    );
  }
}

import 'controller/bat_sensor_connect_controller.dart';
import 'package:flutter/material.dart';
import 'package:talha_s_application_demo/core/app_export.dart';

import '../bat_sensor_connect_screen/Animated_text_pulse.dart';
import 'package:talha_s_application_demo/detection2/google_ml_kit_flutter/packages/example/lib/vision_detector_views/pose_detector_view.dart';

import '../bat_sensor_connect_screen/Fade_in_animation.dart';
import '../bat_sensor_connect_screen/Fade_in_animation_2.dart';
import '../bat_sensor_connect_screen/Fade_in_animation_3.dart';
import 'package:lottie/lottie.dart';
import '../balling_machine_connect_screen/controller/balling_machine_connect_controller.dart';

class BatSensorConnectScreen extends GetWidget<BatSensorConnectController> {
  const BatSensorConnectScreen({Key? key}) : super(key: key);

  void switchToPoseDetectionApp(BuildContext context) {
    BallingMachineConnectController controller = BallingMachineConnectController();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PoseDetectorView(controller: controller)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.black900,
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                  left: 24.h,
                  top: 82.v,
                  right: 24.h,
                  bottom: 100, // Adjust the bottom padding to accommodate the button
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildFrameThirtyNine(),
                    SizedBox(height: 37.v),
                    _buildFrameForty(),
                    SizedBox(height: 37.v),
                    _buildFrameFortyOne(),
                    SizedBox(height: 5.v),
                  ],
                ),
              ),
            ),
            AnimatedTextWithArrow(
              text: 'Tap Here To Continue',
              fontSize: 16, // Adjust the font size as needed
              color: Colors.deepOrange, // Optionally adjust the text color
              onTap: () {
                switchToPoseDetectionApp(context);
              },
            )
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildFrameThirtyNine() {
    return FadeInAnimation(
      child: Container(
        margin: EdgeInsets.only(right: 8.h),
        padding: EdgeInsets.symmetric(vertical: 29.v),
        decoration: AppDecoration.outlineLimeA.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Lottie.asset(
              ImageConstant.anime2,
              height: 76.v,
              width: 74.h,
            ),
            Padding(
              padding: EdgeInsets.only(top: 4.v),
              child: Text(
                "msg_step_one_connect".tr,
                style: theme.textTheme.labelLarge?.copyWith(color: Colors.yellow),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFrameForty() {
    return FadeInAnimation2(
      child: Container(
        margin: EdgeInsets.only(right: 8.h),
        padding: EdgeInsets.symmetric(horizontal: 25.h, vertical: 41.v),
        decoration: AppDecoration.outlineLimeA.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder20,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 187.h,
              margin: EdgeInsets.only(top: 7.v, bottom: 4.v, right: 30.h),
              child: Text(
                "msg_step_two_clean".tr,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.labelLarge?.copyWith(color: Colors.yellow),
              ),
            ),
            Lottie.asset(
              ImageConstant.anime3,
              height: 76.v,
              width: 74.h,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFrameFortyOne() {
    return FadeInAnimation3(
      child: Container(
        margin: EdgeInsets.only(right: 8.h),
        padding: EdgeInsets.symmetric(horizontal: 25.h, vertical: 15.v),
        decoration: AppDecoration.outlineLimeA.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder20,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Lottie.asset(
              ImageConstant.anime4,
              height: 76.v,
              width: 74.h,
            ),
            Container(
              width: 202.h,
              margin: EdgeInsets.only(left: 10.h, top: 25.v, bottom: 25.v),
              child: Text(
                "msg_step_three_make".tr,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.labelLarge?.copyWith(color: Colors.yellow),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: BatSensorConnectScreen(),
    ),
  );
}

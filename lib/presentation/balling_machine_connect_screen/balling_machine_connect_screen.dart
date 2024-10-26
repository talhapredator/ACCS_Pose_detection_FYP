import 'controller/balling_machine_connect_controller.dart';
import 'package:flutter/material.dart';
import 'package:talha_s_application_demo/core/app_export.dart';
import 'package:talha_s_application_demo/widgets/custom_elevated_button.dart';
import 'package:get/get.dart';
import '../bat_sensor_connect_screen/Fade_in_animation.dart';
import 'package:lottie/lottie.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BallingMachineConnectScreen extends GetWidget<BallingMachineConnectController> {
  const BallingMachineConnectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 9.h, vertical: 15.v),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImageConstant.test1),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end, // Align content to the end (right side)
            children: [
              Padding(
                padding: EdgeInsets.only(right: 12.h), // Adjust the right padding as needed
                child: InkWell(
                  onTap: onTapControls,
                  child: Container(
                    height: 50.v,
                    width: 50.v, // Circular button size
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.deepOrange, // Deep orange color for the button
                    ),
                    child: Icon(
                      Icons.settings,
                      size: 30.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 33.v),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 87.h),
                padding: EdgeInsets.symmetric(horizontal: 38.h, vertical: 31.v),

                child: Obx(() {
                  return Text(
                    controller.isConnected.value ? "lbl_connected".tr : "lbl_not_connected".tr,
                    style: theme.textTheme.headlineSmall,
                  );
                }),
              ),
              SizedBox(height: 21.v),
              CustomElevatedButton(
                height: 71.v,
                text: controller.isConnected.value ? "lbl_disconnect".tr : "lbl_connect2".tr,
                margin: EdgeInsets.only(left: 21.h, right: 18.h),
                buttonStyle: controller.isConnected.value
                    ? CustomButtonStyles.fillRed // Use your style for disconnect button
                    : CustomButtonStyles.fillBlue1, // Use your style for connect button
                buttonTextStyle: theme.textTheme.titleLarge,
                onPressed: () async {
                  if (controller.isConnected.value) {
                    await onTapDisconnect();
                  } else {
                    await _attemptConnection(context);
                  }
                  controller.ledstatus = true;
                  if (controller.ledstatus) {
                    controller.sendCmd("poweron");
                  } else {
                    controller.sendCmd("power off");
                    controller.ledstatus = false;
                  }
                },
              ),
              SizedBox(height: 80.v),
              _buildFrameThirtyNine(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFrameThirtyNine() {
    return FadeInAnimation(
      child: Container(
        margin: EdgeInsets.only(right: 8.h),
        padding: EdgeInsets.symmetric(vertical: 29.v),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Lottie.asset(
              ImageConstant.wifi,
              height: 76.v,
              width: 74.h,
            ),
            Padding(
              padding: EdgeInsets.only(top: 4.v),
              child: Text(
                "Before you connect!! :\n\nMake Sure to Connect Your Bowling Machine\nvia Wi-Fi".tr,
                style: theme.textTheme.labelLarge?.copyWith(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onTapControls() {
    Get.toNamed(AppRoutes.iphone1415ProMaxThreeScreen);
  }

  Future<void> _attemptConnection(BuildContext context) async {
    try {
      await controller.connectWebSocket();
      if (!controller.isConnected.value) {
        _showConnectionFailedMessage(context);
      }
    } catch (e) {
      _showConnectionFailedMessage(context);
    }
  }

  Future<void> onTapDisconnect() async {
    await controller.disconnectWebSocket();
  }

  void _showConnectionFailedMessage(BuildContext context) {
    final snackBar = SnackBar(
      content: Text(
        'Unable to connect to Bowling Machine. Make sure WiFi is connected from your phone.',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.redAccent,
      action: SnackBarAction(
        label: 'Retry',
        textColor: Colors.yellow,
        onPressed: () {
          _attemptConnection(context);
        },
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.0),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

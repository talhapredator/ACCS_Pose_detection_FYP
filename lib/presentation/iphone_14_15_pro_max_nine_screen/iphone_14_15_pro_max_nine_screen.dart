import 'controller/iphone_14_15_pro_max_nine_controller.dart';
import 'package:flutter/material.dart';
import 'package:talha_s_application_demo/core/app_export.dart';
import 'package:talha_s_application_demo/widgets/custom_elevated_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Iphone1415ProMaxNineScreen
    extends GetWidget<Iphone1415ProMaxNineController> {
  const Iphone1415ProMaxNineScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: Container(
          width: SizeUtils.width,
          height: SizeUtils.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImageConstant.test1),
              fit: BoxFit.cover,
            ),
          ),
          child: ListView(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 68.v,
                  width: 107.h,
                  padding: EdgeInsets.symmetric(horizontal: 36.h, vertical: 20.v),
                  decoration: AppDecoration.fillLightBlue,
                  child: IconButton(
                    icon: Icon(
                      FontAwesomeIcons.arrowLeft,  // Replace with the desired Font Awesome icon
                      color: Colors.black,  // Set the color according to your design
                    ),
                    onPressed: onPressed,
                  ),
                ),
              ),
              SizedBox(height: 15.v),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 26.h, vertical: 30.v),
                padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 30.v),
                decoration: AppDecoration.outlineBlack9002.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder10,
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10.v),
                    SizedBox(
                      height: 550.v, // Adjust the height as needed
                      width: 341.h,
                      child: SingleChildScrollView(
                        child: Text(
                          "msg_welcome_to_cricketscoreapp".tr,
                          style: CustomTextStyles.titleLargeBlack900B,
                        ),
                      ),
                    ),
                    SizedBox(height: 30.v),
                    SizedBox(height: 5.v),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }



  /// Navigates to the iphone1415ProMaxTwoContainerScreen when the action is triggered.
  onPressed() {
    Get.toNamed(
      AppRoutes.iphone1415ProMaxTwoContainerScreen);
  }
}

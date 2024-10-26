import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talha_s_application_demo/core/app_export.dart';
import 'package:talha_s_application_demo/widgets/custom_elevated_button.dart';
import 'package:flutter/services.dart';
import 'package:talha_s_application_demo/presentation/two_factor/controller/two_factor_controller.dart';

class TwoFactorScreen extends GetWidget<TwoFactorController> {
  const TwoFactorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        body: Container(
          width: SizeUtils.width,
          height: SizeUtils.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImageConstant.test1),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 46.h, vertical: 104.v),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Two-Factor Authentication".tr,
                  style: CustomTextStyles.headlineLargeOnPrimary,
                ),
                SizedBox(height: 71.v),
                Text("Enter OTP".tr, style: theme.textTheme.bodyMedium),
                SizedBox(height: 2.v),
                _buildOtpField(),
                SizedBox(height: 42.v),
                _buildVerifyOtpButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOtpField() {
    return Padding(
      padding: EdgeInsets.only(right: 11),
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          TextFormField(
            controller: controller.otpFieldController,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
            inputFormatters: [LengthLimitingTextInputFormatter(6)], // Limit OTP length
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white.withOpacity(0.9),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
                borderRadius: BorderRadius.circular(10),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
            ),
            style: TextStyle(color: Colors.black),
          ),
          Positioned(
            right: 8.0,
            child: Icon(
              Icons.security,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVerifyOtpButton() {
    return CustomElevatedButton(
      height: 48.v,
      text: "Verify OTP".tr,
      margin: EdgeInsets.only(left: 22.h, right: 20.h),
      buttonStyle: CustomButtonStyles.outlineBlack,
      buttonTextStyle: CustomTextStyles.bodyMediumBlack900,
      onPressed: () {
        controller.onTapVerifyOtpButton();
      },
      alignment: Alignment.center,
    );
  }
}

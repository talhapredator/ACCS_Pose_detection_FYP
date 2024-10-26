import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talha_s_application_demo/core/app_export.dart';
import 'package:talha_s_application_demo/widgets/custom_elevated_button.dart';
import 'package:talha_s_application_demo/widgets/custom_text_form_field.dart';
import 'controller/email_authentication_controller.dart';

class EmailAuthenticationScreen extends GetWidget<EmailAuthenticationController> {
  const EmailAuthenticationScreen({Key? key}) : super(key: key);

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
            padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 10.v),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Email Authentication".tr,
                  style: CustomTextStyles.headlineLargeOnPrimary,
                ),
                SizedBox(height: 71.v),
                Text("Enter Email".tr, style: theme.textTheme.bodyMedium),
                SizedBox(height: 2.v),
                _buildEmailField(),
                SizedBox(height: 42.v),
                _buildAuthenticateEmailButton(),
                SizedBox(height: 42.v),
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

  Widget _buildEmailField() {
    return Padding(
      padding: EdgeInsets.only(right: 11.h),
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          CustomTextFormField(
            controller: controller.emailFieldController,
            borderDecoration: TextFormFieldStyleHelper.outlineBlack,
            fillColor: appTheme.offWhite.withOpacity(0.9),
          ),
          Positioned(
            right: 8.0,
            child: Icon(
              Icons.email,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOtpField() {
    return Padding(
      padding: EdgeInsets.only(right: 11.h),
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          CustomTextFormField(
            controller: controller.otpFieldController,
            borderDecoration: TextFormFieldStyleHelper.outlineBlack,
            fillColor: appTheme.offWhite.withOpacity(0.9),
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

  Widget _buildAuthenticateEmailButton() {
    return CustomElevatedButton(
      height: 48.v,
      text: "Authenticate Email".tr,
      margin: EdgeInsets.only(left: 22.h, right: 20.h),
      buttonStyle: CustomButtonStyles.outlineBlack,
      buttonTextStyle: CustomTextStyles.bodyMediumBlack900,
      onPressed: () {
        controller.onTapAuthenticateEmailButton();
      },
      alignment: Alignment.center,
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

import 'package:flutter/material.dart';
import 'package:talha_s_application_demo/core/app_export.dart';
import 'package:talha_s_application_demo/widgets/custom_elevated_button.dart';
import 'package:talha_s_application_demo/widgets/custom_text_form_field.dart';
import 'package:talha_s_application_demo/database/db_helper.dart';
import 'controller/iphone_14_15_pro_max_five_controller.dart';
import 'package:talha_s_application_demo/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Iphone1415ProMaxFiveScreen extends GetWidget<Iphone1415ProMaxFiveController> {
  const Iphone1415ProMaxFiveScreen({Key? key}) : super(key: key);

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
            padding: EdgeInsets.only(left: 42.h, top: 104.v, right: 42.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 6.h),
                  child: Text(
                    "lbl_sign_up".tr,
                    style: CustomTextStyles.headlineLargeOnPrimary,
                  ),
                ),
                SizedBox(height: 71.v),
                Padding(
                  padding: EdgeInsets.only(left: 4.h, right: 56.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 2.h),
                            child: Text("lbl_first_name".tr, style: theme.textTheme.bodyMedium),
                          ),
                          SizedBox(height: 2.v),
                          _buildFirstNameSection(),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 2.h),
                            child: Text("lbl_last_name".tr, style: theme.textTheme.bodyMedium),
                          ),
                          SizedBox(height: 2.v),
                          _buildLastNameSection(),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 26.v),
                Padding(
                  padding: EdgeInsets.only(left: 3.h),
                  child: Text("lbl_password".tr, style: theme.textTheme.bodyMedium),
                ),
                SizedBox(height: 2.v),
                _buildPasswordSection(),
                SizedBox(height: 27.v),
                Padding(
                  padding: EdgeInsets.only(left: 0.h),
                  child: Text("msg_confirm_password".tr, style: theme.textTheme.bodyMedium),
                ),
                SizedBox(height: 2.v),
                _buildConfirmPasswordSection(),
                SizedBox(height: 27.v),
                Padding(
                  padding: EdgeInsets.only(left: 0.h),
                  child: Text("lbl_username2".tr, style: theme.textTheme.bodyMedium),
                ),
                SizedBox(height: 2.v),
                _buildUserNameSection(),
                SizedBox(height: 80.v),
                _buildSignUpButtonSection(),
                SizedBox(height: 5.v),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFirstNameSection() {
    return CustomTextFormField(
      width: 107.h,
      controller: controller.firstNameSectionController,
      borderDecoration: TextFormFieldStyleHelper.outlineBlackTL102,
      fillColor: appTheme.offWhite,
    );
  }

  Widget _buildLastNameSection() {
    return CustomTextFormField(
      width: 107.h,
      controller: controller.lastNameSectionController,
      borderDecoration: TextFormFieldStyleHelper.outlineBlackTL102,
      fillColor: appTheme.offWhite,
    );
  }

  Widget _buildPasswordSection() {
    return Padding(
      padding: EdgeInsets.only(right: 39.h),
      child: CustomTextFormField(
        controller: controller.passwordSectionController,
        obscureText: true,
        borderDecoration: TextFormFieldStyleHelper.outlineBlackTL10,
        fillColor: appTheme.offWhite,
      ),
    );
  }

  Widget _buildConfirmPasswordSection() {
    return Padding(
      padding: EdgeInsets.only(right: 39.h),
      child: CustomTextFormField(
        controller: controller.confirmPasswordSectionController,
        obscureText: true,
        borderDecoration: TextFormFieldStyleHelper.outlineBlackTL10,
        fillColor: appTheme.offWhite,
      ),
    );
  }

  Widget _buildUserNameSection() {
    return Padding(
      padding: EdgeInsets.only(right: 39.h),
      child: CustomTextFormField(
        controller: controller.userNameSectionController,
        textInputAction: TextInputAction.done,
        borderDecoration: TextFormFieldStyleHelper.outlineBlackTL10,
        fillColor: appTheme.offWhite,
      ),
    );
  }

  Widget _buildSignUpButtonSection() {
    return CustomElevatedButton(
      height: 61.v,
      width: 150.h,
      text: "lbl_sign_up2".tr,
      margin: EdgeInsets.only(left: 22.h, right: 40.h),
      buttonStyle: CustomButtonStyles.outlineBlack,
      buttonTextStyle: CustomTextStyles.bodyMediumBlack900,
      onPressed: () {
        onTapSignUpButtonSection();
      },
      alignment: Alignment.center,
    );
  }

  onTapSignUpButtonSection() async {
    try {
      // Get user input
      String firstname = controller.firstNameSectionController.text;
      String lastname = controller.lastNameSectionController.text;
      String username = controller.userNameSectionController.text;
      String password = controller.passwordSectionController.text;

      // Check if any field is empty
      if (firstname.isEmpty || lastname.isEmpty || username.isEmpty || password.isEmpty) {
        // Handle empty fields (show a snackbar, toast, etc.)
        print('Please fill in all fields');
        return;
      }

      // Add user data to Firestore
      await FirebaseFirestore.instance.collection('users').add({
        'firstname': firstname,
        'lastname': lastname,
        'username': username,
        'password': password,
      });

      // Navigate to the next screen after successful signup
      Get.toNamed(AppRoutes.iphone1415ProMaxOneScreen);
    } catch (e) {
      // Handle any errors that occur during the signup process
      print('Error creating user: $e');
      // Handle error appropriately (show a snackbar, toast, etc.)
    }
  }

}
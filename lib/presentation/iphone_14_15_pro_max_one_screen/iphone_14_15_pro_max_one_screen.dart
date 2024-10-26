import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talha_s_application_demo/core/app_export.dart';
import 'package:talha_s_application_demo/widgets/custom_elevated_button.dart';
import 'package:talha_s_application_demo/widgets/custom_text_form_field.dart';
import 'package:talha_s_application_demo/database/db_helper.dart';
import 'controller/iphone_14_15_pro_max_one_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Iphone1415ProMaxOneScreen extends GetWidget<Iphone1415ProMaxOneController> {
  const Iphone1415ProMaxOneScreen({Key? key}) : super(key: key);

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
                  "lbl_login_page".tr,
                  style: CustomTextStyles.headlineLargeOnPrimary,
                ),
                SizedBox(height: 71.v),
                Text("lbl_username".tr, style: theme.textTheme.bodyMedium),
                SizedBox(height: 2.v),
                _buildUsernameField(),
                SizedBox(height: 42.v),
                Text("lbl_password".tr, style: theme.textTheme.bodyMedium),
                SizedBox(height: 2.v),
                _buildPasswordField(),
                SizedBox(height: 6.v),
                Text(
                  "msg_forgot_password".tr,
                  style: CustomTextStyles.BodyMediumOrangeA.copyWith(

                  ),
                ),
                Spacer(),
                _buildLoginButton(),
                SizedBox(height: 30.v),
                Center(
                  child: Text(
                    "Don't have an account? Sign Up!!",
                    style: TextStyle(color: Colors.deepOrange.shade700),
                    textAlign: TextAlign.center,
                  ),
                ),
                Divider(
                  thickness: 2.0, // Adjust the thickness of the line as needed
                  color: Colors.deepOrange.shade900,
                  height: 10, // Adjust the height between the text and the line as needed
                  indent: 30.0, // Adjust the starting position of the line
                  endIndent: 30.0, // Adjust the ending position of the line
                ),
                SizedBox(height: 20.v),
                _buildCreateAccountButton(),
                SizedBox(height: 41.v),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUsernameField() {
    return Padding(
      padding: EdgeInsets.only(right: 11.h),
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          CustomTextFormField(
            controller: controller.usernameFieldController,
            borderDecoration: TextFormFieldStyleHelper.outlineBlack,
            fillColor: appTheme.offWhite.withOpacity(0.9),
          ),
          Positioned(
            right: 8.0, // Adjust the position as needed
            child: Icon(
              Icons.person,
              color: Colors.black, // Customize the icon color
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildPasswordField() {
    return Padding(
      padding: EdgeInsets.only(right: 11.h),
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          CustomTextFormField(
            controller: controller.passwordFieldController,
            textInputAction: TextInputAction.done,
            obscureText: true,
            borderDecoration: TextFormFieldStyleHelper.outlineBlackTL10,
            fillColor: appTheme.offWhite.withOpacity(0.9),
          ),
          Positioned(
            right: 9.0, // Adjust the position as needed
            child: Icon(
              Icons.lock,
              color: Colors.black26, // Customize the icon color

            ),
          ),
        ],
      ),
    );
  }


  Widget _buildLoginButton() {
    return CustomElevatedButton(
      height: 48.v,
      text: "lbl_login".tr,
      margin: EdgeInsets.only(left: 22.h, right: 20.h),
      buttonStyle: CustomButtonStyles.outlineBlack,
      buttonTextStyle: CustomTextStyles.bodyMediumBlack900,
      onPressed: () {
        onTapLoginButton();
      },
      alignment: Alignment.center,
    );
  }

  Widget _buildCreateAccountButton() {
    return CustomElevatedButton(
      height: 48.v,
      text: "lbl_create_account".tr,
      margin: EdgeInsets.only(left: 22.h, right: 20.h),
      buttonStyle: CustomButtonStyles.outlineBlack,
      buttonTextStyle: CustomTextStyles.bodyMediumBlack900,
      onPressed: () {
        onTapCreateAccountButton();
      },
      alignment: Alignment.center,
    );
  }

  onTapLoginButton() async {
    try {
      String username = controller.usernameFieldController.text;
      String password = controller.passwordFieldController.text;

      // Query Firestore for the user
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('username', isEqualTo: username)
          .where('password', isEqualTo: password)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        Get.toNamed(AppRoutes.iphone1415ProMaxTwoContainerScreen);
      } else {
        print('Invalid login');
      }
    } catch (e) {
      print('Error signing in: $e');
      // Handle error appropriately (show a snackbar, toast, etc.)
    }
  }


  onTapCreateAccountButton() {
    Get.toNamed(AppRoutes.iphone1415ProMaxFiveScreen);
  }
}
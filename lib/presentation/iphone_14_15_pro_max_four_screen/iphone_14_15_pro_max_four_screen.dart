import 'controller/iphone_14_15_pro_max_four_controller.dart';
import 'package:flutter/material.dart';
import 'package:talha_s_application_demo/core/app_export.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Iphone1415ProMaxFourScreen
    extends GetWidget<Iphone1415ProMaxFourController> {
  const Iphone1415ProMaxFourScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: 20.v, horizontal: 20.h),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImageConstant.test1),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              _buildProfileEditForm(),
              Spacer(),
              _buildSubmitButton(context),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.deepOrange,
      leading: IconButton(
        icon: Icon(
          FontAwesomeIcons.arrowLeft,
          color: Colors.white,
        ),
        onPressed: () {
          onPressed();
        },
      ),
      title: Text(
        "Profile Edit",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
      ),
      centerTitle: true,
    );
  }

  Widget _buildProfileEditForm() {
    return Container(
      padding: EdgeInsets.all(20.v),
      decoration: BoxDecoration(

        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTextField("Name", controller.seventyFourController),
          SizedBox(height: 20.v),
          _buildTextField("Age", controller.seventyFiveController),
          SizedBox(height: 20.v),
          _buildTextField("Style", controller.seventySixController),
          SizedBox(height: 20.v),
          _buildTextField("Gender", controller.seventySevenController),
          SizedBox(height: 20.v),
          _buildTextField("Height", controller.thirtyThreeController),
        ],
      ),
    );
  }

  Widget _buildTextField(String labelText, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyle(
            color: Colors.deepOrange,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8.v),
        Container(
          decoration: BoxDecoration(
            color: Colors.orange[50],
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(color: Colors.deepOrange),
            boxShadow: [
              BoxShadow(
                color: Colors.orange.withOpacity(0.2),
                blurRadius: 6,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 5.v),
            child: TextFormField(
              controller: controller,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 15.v),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(
          EdgeInsets.symmetric(vertical: 20.v, horizontal: 90.h),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
          // Set different colors for different button states (like pressed, hovered)

          return Colors.transparent; // Default color
        }),
      ),
      onPressed: () {
        // Handle the submit action here
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Profile Updated"),
            backgroundColor: Colors.deepOrange,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        );
      },
      child: Ink(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orangeAccent, Colors.deepOrange],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Container(
          alignment: Alignment.center,
          constraints: BoxConstraints(
            minHeight: 50.v,
            minWidth: 150.h,
          ),
          child: Text(
            "Submit",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }


  void onPressed() {
    Get.toNamed(AppRoutes.iphone1415ProMaxTwoContainerScreen);
  }
}

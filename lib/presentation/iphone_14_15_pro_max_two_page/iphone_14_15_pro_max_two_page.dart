import '../iphone_14_15_pro_max_two_page/widgets/custobox_item_widget.dart';
import '../iphone_14_15_pro_max_two_page/widgets/pulse_border_animation.dart';
import 'controller/iphone_14_15_pro_max_two_controller.dart';
import 'models/custobox_item_model.dart';
import 'models/iphone_14_15_pro_max_two_model.dart';
import 'package:flutter/material.dart';
import 'package:talha_s_application_demo/core/app_export.dart';
import 'package:talha_s_application_demo/widgets/app_bar/appbar_subtitle.dart';
import 'package:talha_s_application_demo/widgets/app_bar/custom_app_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Iphone1415ProMaxTwoPage extends StatelessWidget {
  Iphone1415ProMaxTwoPage({Key? key}) : super(key: key);

  final Iphone1415ProMaxTwoController controller = Get.put(Iphone1415ProMaxTwoController(Iphone1415ProMaxTwoModel().obs));

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () async {
        // Show logout confirmation dialog
        bool shouldPop = await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Colors.black, // Set background color to black
              title: Text(
                'Logout Confirmation',
                style: TextStyle(color: Colors.white), // Set title color to blue
              ),
              content: Text(
                'Are you sure you want to logout?',
                style: TextStyle(color: Colors.white), // Set content color to blue
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false); // Close the dialog and return false (do not pop)
                  },
                  child: Text('Cancel', style: TextStyle(color: Colors.blue)), // Set button text color to blue
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true); // Close the dialog and return true (allow pop)
                  },
                  child: Text('Logout', style: TextStyle(color: Colors.blue)), // Set button text color to blue
                ),
              ],
            );
          },
        );

        // Return false to prevent navigation if the user clicks Cancel
        // Return true to allow navigation if the user clicks Logout
        return shouldPop ?? false;
      },
      child: SafeArea(
        child: Scaffold(
          extendBody: true,
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.transparent,
          appBar: _buildAppBar(context),
          body: Container(
            width: screenWidth,
            height: screenHeight,
            padding: EdgeInsets.only(top: screenHeight * 0.01),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImageConstant.test1),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.03,
                vertical: screenHeight * 0.03,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight * 0.000000001),
                  _buildCustobox(),
                  SizedBox(height: screenHeight * 0.05),
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.01),
                    child: Text(
                      "lbl_connect".tr,
                      style: CustomTextStyles.titleLargeBold,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.008),
                  SizedBox(
                    height: screenHeight * 0.1,
                    width: screenWidth * 0.2,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: GestureDetector(
                            onTap: onTapView,
                            child: PulseColorAnimation(
                              child: Container(
                                height: screenHeight * 0.1,
                                width: screenWidth * 1.5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(screenHeight * 0.05),
                                  border: Border.all(
                                    color: appTheme.black900,
                                    width: 1.0,
                                  ),
                                  image: DecorationImage(
                                    image: AssetImage(ImageConstant.test6),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            height: screenHeight * 0.04,
                            width: screenWidth * 1,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Icon(
                                  Icons.cable_sharp,
                                  color: Colors.black,
                                  size: screenHeight * 0.035,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


  // PreferredSizeWidget _buildAppBar() {
  //   return CustomAppBar(
  //     leadingWidth: 67.h,
  //     leading: IconButton(
  //       icon: Icon(
  //         FontAwesomeIcons.powerOff,
  //         color: Colors.black,
  //       ),
  //       onPressed: onPressed,
  //     ),
  //     centerTitle: true,
  //     title: AppbarSubtitle(text: "lbl_menu".tr),
  //     styleType: Style.bgFill_2,
  //   );
  // }
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 67.h,
      leading: IconButton(
        icon: Icon(
          FontAwesomeIcons.powerOff,
          color: Colors.red,
        ),
        onPressed: () {
          // Show logout confirmation dialog
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Colors.black,
                title: Text('Logout Confirmation'),
                content: Text('Are you sure you want to logout?'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                    },
                    child: Text('Cancel', style: TextStyle(color: Colors.deepOrange)),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                      onPressed();
                    },
                    child: Text('Logout', style: TextStyle(color: Colors.deepOrange)),
                  ),
                ],
              );
            },
          );
        },
      ),
      centerTitle: true,
      title: AppbarSubtitle(text: "lbl_menu".tr),
      styleType: Style.bgFill_2,
      actions: [
        TextButton(
          onPressed: () {
            Get.toNamed(AppRoutes.EmailAuthentication);
          },
          child: Text(
            'Verify Account',
            style: TextStyle(color: Colors.deepOrange),
          ),
        ),
      ],
    );
  }




  Widget _buildCustobox() {
    return Obx(() => ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (context, index) {
        return SizedBox(height: 50.v);
      },
      itemCount: controller.iphone1415ProMaxTwoModelObj.value.custoboxItemList.value.length,
      itemBuilder: (context, index) {
        CustoboxItemModel model = controller.iphone1415ProMaxTwoModelObj.value.custoboxItemList.value[index];
        return CustoboxItemWidget(
          model,
          onTap: () {
            if (index == 0) {
              onTapTwentyFour();
            } else if (index == 1) {
              onTapTwentyFive();
            } else {
              onTapTwentySix();
            }
          },
        );
      },
    ));
  }

  void onTap() {
    Get.toNamed(AppRoutes.iphone1415ProMaxSixScreen);
  }

  void onPressed() {
    Get.toNamed(AppRoutes.iphone1415ProMaxOneScreen);
  }

  void onTapTwentyFour() {
    print('Tapped on Box 1');
    Get.toNamed(AppRoutes.iphone1415ProMaxSixScreen);
  }

  void onTapTwentyFive() {
    print('Tapped on Box 2');
    Get.toNamed(AppRoutes.iphone1415ProMaxSevenScreen);
  }

  void onTapTwentySix() {
    print('Tapped on Box 3');
    Get.toNamed(AppRoutes.iphone1415ProMaxNineScreen);
  }

  void onTapView() {
    Get.toNamed(AppRoutes.ballingMachineConnectScreen);
  }
}

import 'controller/app_navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:talha_s_application_demo/core/app_export.dart';

// ignore_for_file: must_be_immutable
class AppNavigationScreen extends GetWidget<AppNavigationController> {
  const AppNavigationScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFFFFFFF),
        body: SizedBox(
          width: 375.h,
          child: Column(
            children: [
              _buildAppNavigation(),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0XFFFFFFFF),
                    ),
                    child: Column(
                      children: [
                        _buildScreenTitle(
                          screenTitle: "iPhone 14 & 15 Pro Max - One".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.iphone1415ProMaxOneScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Bat Sensor - Connect".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.batSensorConnectScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "iPhone 14 & 15 Pro Max - Six".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.iphone1415ProMaxSixScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "iPhone 14 & 15 Pro Max - Seven".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.iphone1415ProMaxSevenScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "iPhone 14 & 15 Pro Max - Eight".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.iphone1415ProMaxEightScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle:
                              "iPhone 14 & 15 Pro Max - Two - Container".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.iphone1415ProMaxTwoContainerScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "iPhone 14 & 15 Pro Max - Three".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.iphone1415ProMaxThreeScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "iPhone 14 & 15 Pro Max - Four".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.iphone1415ProMaxFourScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "iPhone 14 & 15 Pro Max - Five".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.iphone1415ProMaxFiveScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "iPhone 14 & 15 Pro Max - Nine".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.iphone1415ProMaxNineScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Frame Two".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.frameTwoScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Balling Machine - Connect".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.ballingMachineConnectScreen),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildAppNavigation() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0XFFFFFFFF),
      ),
      child: Column(
        children: [
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Text(
                "App Navigation".tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF000000),
                  fontSize: 20.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.h),
              child: Text(
                "Check your app's UI from the below demo screens of your app."
                    .tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF888888),
                  fontSize: 16.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 5.v),
          Divider(
            height: 1.v,
            thickness: 1.v,
            color: Color(0XFF000000),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildScreenTitle({
    required String screenTitle,
    Function? onTapScreenTitle,
  }) {
    return GestureDetector(
      onTap: () {
        onTapScreenTitle!.call();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0XFFFFFFFF),
        ),
        child: Column(
          children: [
            SizedBox(height: 10.v),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Text(
                  screenTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0XFF000000),
                    fontSize: 20.fSize,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.v),
            SizedBox(height: 5.v),
            Divider(
              height: 1.v,
              thickness: 1.v,
              color: Color(0XFF888888),
            ),
          ],
        ),
      ),
    );
  }

  /// Common click event
  void onTapScreenTitle(String routeName) {
    Get.toNamed(routeName);
  }
}

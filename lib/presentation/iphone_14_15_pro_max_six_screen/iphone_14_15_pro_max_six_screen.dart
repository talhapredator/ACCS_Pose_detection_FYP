import 'controller/iphone_14_15_pro_max_six_controller.dart';
import 'package:flutter/material.dart';
import 'package:talha_s_application_demo/core/app_export.dart';
import 'package:talha_s_application_demo/presentation/iphone_14_15_pro_max_two_page/iphone_14_15_pro_max_two_page.dart';
import 'package:talha_s_application_demo/widgets/custom_bottom_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore_for_file: must_be_immutable
class Iphone1415ProMaxSixScreen
    extends GetWidget<Iphone1415ProMaxSixController> {
  const Iphone1415ProMaxSixScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: Container(
          width: SizeUtils.width,
          height: SizeUtils.height,
          padding: EdgeInsets.only(bottom: 68.v),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                ImageConstant.test1,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(vertical: 15.v),
            child: Column(
              children: [
                _buildArrowDownSection(),
                SizedBox(height: 40.v),
                _buildProfileSection(),
                SizedBox(height: 36.v),
                _buildBallFacedSection(),
                SizedBox(height: 5.v),
              ],
            ),
          ),
        ),
        bottomNavigationBar: _buildBottomBarSection(),
      ),
    );
  }

  /// Section Widget
  Widget _buildArrowDownSection() {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 24.h,
        vertical: 21.v,
      ),
      decoration: AppDecoration.fillPrimary,
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              FontAwesomeIcons.arrowLeft,  // Replace with the desired Font Awesome icon
              color: Colors.black,  // Set the color according to your design
            ),
            onPressed: () {
              onPressed();
            },
          ),

          Padding(
            padding: EdgeInsets.only(
              left: 64.h,
              top: 1.v,
            ),
            child: Text(
              "lbl_profile_history".tr,
              style: theme.textTheme.headlineLarge,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildProfileSection() {
    return SizedBox(
      height: 226.v,
      width: 400.h,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          CustomImageView(
            imagePath: ImageConstant.test2,
            height: 225.v,
            width: 400.h,
            radius: BorderRadius.circular(
              23.h,
            ),
            alignment: Alignment.center,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.4), // Adjust the opacity as needed
              BlendMode.srcOver,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.only(
                right: 8.h,
                bottom: 79.v,
              ),
              child: Text(
                "lbl_76".tr,
                style: theme.textTheme.titleMedium,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.only(
                top: 68.v,
                right: 11.h,
              ),
              child: Text(
                "lbl_age_29".tr,
                style: theme.textTheme.titleMedium,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 40.v),
              child: SizedBox(
                width: 400.h,
                child: Divider(),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 9.v),
              child: Text(
                "lbl_profile".tr,
                style: CustomTextStyles.titleLargeLimeA200,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(right: 15.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 28.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // CustomImageView(
                              // imagePath: ImageConstant.imgRectangle35,
                              // height: 66.v,
                              // width: 76.h,
                            // ),
                            SizedBox(height: 4.v),
                            Padding(
                              padding: EdgeInsets.only(left: 7.h),
                              child: Text(
                                "lbl_talha_ali".tr,
                                style: theme.textTheme.titleMedium,
                              ),
                            ),
                            SizedBox(height: 30.v),
                            Padding(
                              padding: EdgeInsets.only(left: 6.h),
                              child: Text(
                                "lbl_style".tr,
                                style: theme.textTheme.titleMedium,
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,

                              child: Text(
                                "lbl_right_handed".tr,
                                style: theme.textTheme.titleMedium,

                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 88.v,
                            bottom: 25.v,
                          ),
                          child: Text(
                            "lbl_accuracy".tr,
                            style: theme.textTheme.titleMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 33.v),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 1.v),
                          child: Text(
                            "lbl_minutes_played".tr,
                            style: CustomTextStyles.titleSmallLimeA200,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 9.h),
                          child: Text(
                            "lbl_00_00".tr,
                            style: CustomTextStyles.titleSmallLimeA200,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildBallFacedSection() {
    return Padding(
      padding: EdgeInsets.only(
        left: 38.h,
        right: 35.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildSessionsSection(
            userImage: ImageConstant.imgRectangle32,
            sessions: "lbl_graph".tr,
          ),
          _buildSessionsSection(
            userImage: ImageConstant.imgRectangle33,
            sessions: "lbl_sessions".tr,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 74.v,
                width: 83.h,
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgRectangle34,
                      height: 74.v,
                      width: 83.h,
                      radius: BorderRadius.circular(
                        15.h,
                      ),
                      alignment: Alignment.center,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 25.h),
                        child: Text(
                          "lbl_10".tr,
                          style: CustomTextStyles.headlineLargeOnPrimary_1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 14.v),
              Padding(
                padding: EdgeInsets.only(left: 7.h),
                child: Text(
                  "lbl_ball_faced".tr,
                  style: CustomTextStyles.titleSmallOnPrimary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildBottomBarSection() {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        Get.toNamed(getCurrentRoute(type));
      },
    );
  }

  /// Common widget
  Widget _buildSessionsSection({
    required String userImage,
    required String sessions,
  }) {
    return Column(
      children: [
        CustomImageView(
          imagePath: userImage,
          height: 74.v,
          width: 83.h,
          radius: BorderRadius.circular(
            15.h,
          ),
        ),
        SizedBox(height: 14.v),
        Text(
          sessions,
          style: CustomTextStyles.titleSmallOnPrimary.copyWith(
            color: theme.colorScheme.onPrimary,
          ),
        ),
      ],
    );
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Connection:
        return AppRoutes.iphone1415ProMaxTwoContainerScreen;
      case BottomBarEnum.Controls:
        return AppRoutes.iphone1415ProMaxThreeScreen;
      case BottomBarEnum.Edit:
        return AppRoutes.iphone1415ProMaxFourScreen;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.iphone1415ProMaxTwoPage:
        return Iphone1415ProMaxTwoPage();
      default:
        return DefaultWidget();
    }
  }
}

onPressed() {
  Get.toNamed(
      AppRoutes.iphone1415ProMaxTwoContainerScreen);

}
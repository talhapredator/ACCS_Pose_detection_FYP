import 'controller/iphone_14_15_pro_max_two_container_controller.dart';
import 'package:flutter/material.dart';
import 'package:talha_s_application_demo/core/app_export.dart';
import 'package:talha_s_application_demo/presentation/iphone_14_15_pro_max_two_page/iphone_14_15_pro_max_two_page.dart';
import 'package:talha_s_application_demo/widgets/custom_bottom_bar.dart';

class Iphone1415ProMaxTwoContainerScreen
    extends GetWidget<Iphone1415ProMaxTwoContainerController> {
  const Iphone1415ProMaxTwoContainerScreen({Key? key}) : super(key: key);

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
            // image: DecorationImage(
            //   image: AssetImage(ImageConstant.test1),
            //   fit: BoxFit.cover,
            // ),
          ),
          child: getCurrentPage(AppRoutes.iphone1415ProMaxTwoPage),
        ),
        bottomNavigationBar: _buildBottomBar(),
      ),
    );
  }

  /// Section Widget
  Widget _buildBottomBar() {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Get.toNamed(getCurrentRoute(type));
    });
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Connection:
        return AppRoutes.iphone1415ProMaxTwoPage;
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

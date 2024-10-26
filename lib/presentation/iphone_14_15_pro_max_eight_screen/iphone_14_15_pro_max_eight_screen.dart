import '../iphone_14_15_pro_max_eight_screen/widgets/fortyfour_item_widget.dart';
import 'controller/iphone_14_15_pro_max_eight_controller.dart';
import 'models/fortyfour_item_model.dart';
import 'package:flutter/material.dart';
import 'package:talha_s_application_demo/core/app_export.dart';
import 'package:talha_s_application_demo/widgets/app_bar/appbar_leading_image.dart';
import 'package:talha_s_application_demo/widgets/app_bar/appbar_subtitle.dart';
import 'package:talha_s_application_demo/widgets/app_bar/custom_app_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Iphone1415ProMaxEightScreen
    extends GetWidget<Iphone1415ProMaxEightController> {
  const Iphone1415ProMaxEightScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            appBar: _buildAppBar(),
            body: Container(
                width: SizeUtils.width,
                height: SizeUtils.height,
                padding: EdgeInsets.only(top: 88.v),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(ImageConstant.test1),
                        fit: BoxFit.cover)),
                child: Container(
                    width: double.maxFinite,
                    padding:
                        EdgeInsets.symmetric(horizontal: 43.h, vertical: 28.v),
                    child: Column(children: [
                      _buildFortyFour(),
                      Spacer(),
                      SizedBox(height: 32.v),
                      GestureDetector(
                          onTap: () {
                            onTapFive();
                          },
                          child: Container(
                              height: 74.v,
                              width: 112.h,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 39.h, vertical: 23.v),
                              decoration: AppDecoration.fillLimeA.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder30),
                              child: CustomImageView(
                                  imagePath:
                                      ImageConstant.imgArrowLeftUndefined,
                                  height: 28.v,
                                  width: 34.h,
                                  alignment: Alignment.center)))
                    ])))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        leadingWidth: 67.h,
        leading: IconButton(
          icon: Icon(
            FontAwesomeIcons.arrowLeft,  // Replace with the desired Font Awesome icon
            color: Colors.black,  // Set the color according to your design
          ),
          onPressed: () {
            onPressed();
          },
        ),
        title: AppbarSubtitle(text: "lbl_playlist".tr),
        styleType: Style.bgFill);
  }

  /// Section Widget
  Widget _buildFortyFour() {
    return Obx(() => GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 128.v,
            crossAxisCount: 2,
            mainAxisSpacing: 48.h,
            crossAxisSpacing: 48.h),
        physics: NeverScrollableScrollPhysics(),
        itemCount: controller
            .iphone1415ProMaxEightModelObj.value.fortyfourItemList.value.length,
        itemBuilder: (context, index) {
          FortyfourItemModel model = controller.iphone1415ProMaxEightModelObj
              .value.fortyfourItemList.value[index];
          return FortyfourItemWidget(model);
        }));
  }

  /// Navigates to the iphone1415ProMaxSevenScreen when the action is triggered.
  onTapFive() {
    Get.toNamed(
      AppRoutes.iphone1415ProMaxSevenScreen,
    );
  }
  onPressed() {
    Get.toNamed(
      AppRoutes.iphone1415ProMaxSevenScreen,
    );

  }
}

import '../controller/iphone_14_15_pro_max_eight_controller.dart';
import '../models/fortyfour_item_model.dart';
import 'package:flutter/material.dart';
import 'package:talha_s_application_demo/core/app_export.dart';
import 'package:talha_s_application_demo/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class FortyfourItemWidget extends StatelessWidget {
  FortyfourItemWidget(
    this.fortyfourItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  FortyfourItemModel fortyfourItemModelObj;

  var controller = Get.find<Iphone1415ProMaxEightController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 127.v,
      width: 148.h,
      padding: EdgeInsets.symmetric(
        horizontal: 42.h,
        vertical: 32.v,
      ),
      decoration: AppDecoration.fillLimeA,
      child: CustomIconButton(
        height: 63.adaptSize,
        width: 63.adaptSize,
        alignment: Alignment.center,
        child: CustomImageView(
          imagePath: ImageConstant.imgRectangle36,
        ),
      ),
    );
  }
}

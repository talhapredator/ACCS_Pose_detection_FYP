import '../controller/iphone_14_15_pro_max_two_controller.dart';
import '../models/custobox_item_model.dart';
import 'package:flutter/material.dart';
import 'package:talha_s_application_demo/core/app_export.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustoboxItemWidget extends StatelessWidget {
  CustoboxItemWidget(
      this.custoboxItemModelObj, {
        Key? key,
        this.onTapTwentyFour,
        this.onTapTwentyFive,
        this.onTapTwentySix,
        this.onTap,
      }) : super(
    key: key,
  );

  final CustoboxItemModel custoboxItemModelObj;
  final VoidCallback? onTapTwentyFour;
  final VoidCallback? onTapTwentyFive;
  final VoidCallback? onTapTwentySix;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black87.withOpacity(0.9),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Container(
          decoration: AppDecoration.fillLimeA200.copyWith(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(
                        () => CustomImageView(
                      imagePath: custoboxItemModelObj.customizationImage!.value,
                      height: 37.v,
                      width: 40.h,
                      radius: BorderRadius.only(
                        topLeft: Radius.circular(15.h),
                        bottomRight: Radius.circular(15.h),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 13.h,
                      top: 7.v,
                      bottom: 11.v,
                    ),
                    child: Obx(
                          () => Text(
                        custoboxItemModelObj.customizationText!.value,
                        style: theme.textTheme.titleSmall,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 7.v),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 369.h,
                  margin: EdgeInsets.only(
                    left: 18.h,
                    right: 11.h,
                  ),
                  child: Obx(
                        () => Text(
                      custoboxItemModelObj.customizationDescription!.value,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.justify,
                      style: theme.textTheme.bodySmall,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.v),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    onTap?.call();
                    onTapTwentyFour?.call();
                    onTapTwentyFive?.call();
                    onTapTwentySix?.call();
                  },
                  child: Container(
                    height: 40.v,
                    width: 80.h,
                    padding: EdgeInsets.symmetric(
                      horizontal: 14.h,
                      vertical: 4.v,
                    ),
                    decoration: AppDecoration.outlineBlack.copyWith(
                      borderRadius: BorderRadiusStyle.customBorderTL15,
                    ),
                    child: Container(
                      height: 20, // Adjust the height as needed
                      width: 20,  // Adjust the width as needed
                      child: Icon(
                        FontAwesomeIcons.arrowRight,  // Replace with the desired Font Awesome icon
                        size: 20,
                        color: Colors.black,  // Set the color according to your design
                      ),
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
}

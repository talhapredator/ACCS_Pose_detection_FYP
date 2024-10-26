import 'package:flutter/material.dart';
import 'package:talha_s_application_demo/core/app_export.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    Key? key,
    this.height,
    this.styleType,
    this.leadingWidth,
    this.leading,
    this.title,
    this.centerTitle,
    this.actions,
  }) : super(
          key: key,
        );

  final double? height;

  final Style? styleType;

  final double? leadingWidth;

  final Widget? leading;

  final Widget? title;

  final bool? centerTitle;

  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: height ?? 88.v,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      flexibleSpace: _getStyle(),
      leadingWidth: leadingWidth ?? 0,
      leading: leading,
      title: title,
      titleSpacing: 0,
      centerTitle: centerTitle ?? false,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size(
        SizeUtils.width,
        height ?? 88.v,
      );
  _getStyle() {
    switch (styleType) {
      case Style.bgFill_1:
        return Container(
          height: 88.v,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: theme.colorScheme.secondaryContainer,
          ),
        );
      case Style.bgFill_2:
        return Container(
          height: 88.v,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: theme.colorScheme.primary.withOpacity(0.72),
          ),
        );
      case Style.bgFill:
        return Container(
          height: 88.v,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: appTheme.limeA200.withOpacity(0.8),
          ),
        );
      case Style.bgR:
        return Container(
          height: 88.v,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: appTheme.deepOrangeA700.withOpacity(0.9),
          ),
        );
      default:
        return null;
    }
  }
}

enum Style {
  bgFill_1,
  bgFill_2,
  bgFill,
  bgR,
}

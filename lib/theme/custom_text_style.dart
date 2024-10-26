import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyMediumBlack900 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w800,
      );
  static get bodyMediumRegular => theme.textTheme.bodyMedium!.copyWith(
        fontWeight: FontWeight.w400,
      );
  static get bodySmallInriaSansOnPrimary =>
      theme.textTheme.bodySmall!.inriaSans.copyWith(
        color: theme.colorScheme.onPrimary,
        fontSize: 10.fSize,
      );
  // Headline text style
  static get headlineLargeLimeA200 => theme.textTheme.headlineLarge!.copyWith(
        color: appTheme.limeA200,
      );
  static get headlineLargeOnPrimary => theme.textTheme.headlineLarge!.copyWith(
        color: theme.colorScheme.onPrimary,
      );
  static get headlineLargeOnPrimary_1 =>
      theme.textTheme.headlineLarge!.copyWith(
        color: theme.colorScheme.onPrimary,
      );
  static get headlineLargeRegular => theme.textTheme.headlineLarge!.copyWith(
        fontWeight: FontWeight.w400,
      );
  static get headlineSmallRedA700 => theme.textTheme.headlineSmall!.copyWith(
        color: appTheme.redA700,
      );
  // Label text style
  static get labelLargeOnPrimary => theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.onPrimary,
      );
  // Title text style
  static get titleLargeBlack900 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.black900,
      );
  static get titleLargeBlack900B => theme.textTheme.titleLarge!.copyWith(
    color: appTheme.black900,
    fontSize: 18.fSize,
  );
  static get titleLargeBold => theme.textTheme.titleLarge!.copyWith(
        fontWeight: FontWeight.w700,
      );
  static get titleLargeDeeporangeA700 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.deepOrangeA700,
        fontSize: 28.fSize,

      );
  static get titleLargeDeeporangeA700B => theme.textTheme.titleLarge!.copyWith(
    color: appTheme.deepOrangeA700,
    fontSize: 14.fSize,

  );
  static get titleLargeLimeA200 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.limeA200,
        fontSize: 20.fSize,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumOnPrimary => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.onPrimary,
        fontSize: 18.fSize,
      );
  static get titleSmallLimeA200 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.limeA200,
      );

  static get BodyMediumLimeA200 => theme.textTheme.titleMedium!.copyWith(
    color: appTheme.limeA200,
  );
  static get BodyMediumOrangeA => theme.textTheme.titleMedium!.copyWith(
    color: appTheme.deepOrangeA700,
  );
  static get titleSmallOnPrimary => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.onPrimary,
      );
}

extension on TextStyle {
  TextStyle get inriaSans {
    return copyWith(
      fontFamily: 'Inria Sans',
    );
  }

  TextStyle get itim {
    return copyWith(
      fontFamily: 'Itim',
    );
  }
}

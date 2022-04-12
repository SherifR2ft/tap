import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tap_assignment_sherif/constant/colors.dart';

class LocaleConstants {
  static const englishLocale = 'en';
}

class Constants {
// Duration
  static const timeOut = Duration(seconds: 30);

// size
  static const double buttonHeight = 50.0;
  static const double fieldsPadding = 12.0;
  static const double horizontalPadding = 18.0;

// TextInputFormatter
  static final List<TextInputFormatter> numberInputFormatter = [
    // add range for decimal number {0->2}
    FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
    FilteringTextInputFormatter.deny(RegExp(r'^00+')),
  ];

  // TextInputType
  static const positiveDecimalNumber =
      TextInputType.numberWithOptions(decimal: true, signed: false);

// values
  static const double elevation = 1.8;

// Shadows
  static const BoxShadow primaryShadow = BoxShadow(
    color: AppColors.primaryShadowColor,
    offset: Offset(0, 0),
    blurRadius: 8,
  );

  static const BoxShadow primaryShadowDark = BoxShadow(
    color: AppColors.primaryShadowColorDark,
    offset: Offset(0, 0),
    blurRadius: 8,
  );

// Radius
  static const BorderRadius borderRadius =
      BorderRadius.all(Radius.circular(25));

  static const BorderRadius radiusPopup = BorderRadius.all(
    Radius.circular(20),
  );

// BoxDecorations
  static const BoxDecoration primaryBoxDecoration = BoxDecoration(
    color: AppColors.primaryElement,
    boxShadow: [primaryShadow],
    borderRadius: borderRadius,
  );
  static const BoxDecoration primaryBoxDecorationDark = BoxDecoration(
    color: AppColors.primaryElement,
    boxShadow: [primaryShadowDark],
    borderRadius: borderRadius,
  );

  static const BoxDecoration primaryContainerBoxDecoration = BoxDecoration(
    color: AppColors.primaryBackGroundColor,
    boxShadow: [primaryShadow],
    borderRadius: borderRadius,
  );
  static const BoxDecoration primaryDarkContainerBoxDecoration = BoxDecoration(
    color: AppColors.primaryBackGroundColorDark,
    boxShadow: [primaryShadowDark],
    borderRadius: borderRadius,
  );

  static const BoxDecoration disableBoxDecoration = BoxDecoration(
    color: AppColors.disablePrimaryElement,
    borderRadius: borderRadius,
  );

  static const BoxDecoration popUpBoxDecoration = BoxDecoration(
    color: AppColors.primaryBackGroundColor,
    borderRadius: radiusPopup,
  );

  static const BoxDecoration popUpBoxDecorationDark = BoxDecoration(
    color: AppColors.primaryBackGroundColorDark,
    borderRadius: radiusPopup,
  );

// border
  static const textFieldBorder = OutlineInputBorder(
    borderRadius: borderRadius,
  );

  static const enabledBorder = OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.border, width: 0.1),
    borderRadius: borderRadius,
  );

  static const enabledBorderSearch = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent, width: 0.1),
    borderRadius: borderRadius,
  );

  static const disabledBorder = OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.border, width: 0.1),
    borderRadius: borderRadius,
  );

  static const disabledBorderSearch = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent, width: 0.1),
    borderRadius: borderRadius,
  );
  static const focusedBorder = OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.focusBorder, width: 1),
    borderRadius: borderRadius,
  );
}

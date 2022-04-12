import 'package:flutter/material.dart';
import 'package:tap_assignment_sherif/constant/colors.dart';

class AppTheme {
  // light
  static get lightTheme => _lightTheme;
  static final _lightTheme = ThemeData(
    backgroundColor: AppColors.primaryBackGroundColor,
    indicatorColor: AppColors.primaryElement,
    primaryColor: AppColors.primaryText,
    iconTheme: const IconThemeData(color: AppColors.hintColor),
    scaffoldBackgroundColor: AppColors.secondaryBackGroundColor,
    hintColor: AppColors.hintColor,
    hoverColor: AppColors.primaryBackGroundColor,
    focusColor: AppColors.disablePrimaryElement,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: AppColors.primaryElement,
    ),
    textSelectionTheme:
        const TextSelectionThemeData(cursorColor: AppColors.primaryElement),
    shadowColor: AppColors.primaryShadowColor,
    textTheme: const TextTheme(
      headline1: TextStyle(
        color: AppColors.primaryText,
        fontWeight: FontWeight.w400,
      ),
      headline2: TextStyle(
        color: AppColors.primaryText,
        fontWeight: FontWeight.w400,
      ),
      headline3: TextStyle(
        color: AppColors.successColor,
        fontWeight: FontWeight.w400,
      ),
      headline4: TextStyle(
        height: 1.8,
        color: AppColors.primaryText,
      ),
      headline5: TextStyle(
        height: 2.2,
        color: AppColors.primaryText,
        fontWeight: FontWeight.w900,
      ),
      headline6: TextStyle(
        color: AppColors.primaryText,
        fontWeight: FontWeight.w900,
      ),
      subtitle1: TextStyle(
        color: AppColors.primaryText,
        fontWeight: FontWeight.w600,
      ),
      subtitle2: TextStyle(
        color: AppColors.grayText,
      ),
      bodyText1: TextStyle(
          height: 2.5,
          color: AppColors.primaryElement,
          fontWeight: FontWeight.w700
          // textBaseline: TextAlign.center ,
          ),
      bodyText2: TextStyle(
        color: AppColors.thirdText,
        fontWeight: FontWeight.w400,
      ),
      button: TextStyle(
        color: AppColors.secondaryText,
        fontWeight: FontWeight.normal,
        letterSpacing: -0.0045,
      ),
      caption: TextStyle(
        color: AppColors.hintColor,
        fontWeight: FontWeight.w400,
      ),
      overline: TextStyle(
        color: AppColors.primaryText,
        fontWeight: FontWeight.w700,
      ),
    ),
  );
  // dark
  static get darkTheme => _darkTheme;
  static final _darkTheme = ThemeData(
    backgroundColor: AppColors.primaryBackGroundColorDark,
    indicatorColor: AppColors.primaryElement,
    primaryColor: AppColors.secondaryText,
    iconTheme: const IconThemeData(color: AppColors.hintColorDark),
    scaffoldBackgroundColor: AppColors.secondaryBackGroundColorDark,
    hintColor: AppColors.hintColorDark,
    hoverColor: AppColors.primaryBackGroundColorDark,
    focusColor: AppColors.disablePrimaryElement,
    shadowColor: AppColors.primaryShadowColorDark,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: AppColors.primaryElement,
    ),
    textSelectionTheme:
        const TextSelectionThemeData(cursorColor: AppColors.primaryElement),
    textTheme: const TextTheme(
      headline1: TextStyle(
        color: AppColors.secondaryText,
        fontWeight: FontWeight.w400,
      ),
      headline2: TextStyle(
        color: AppColors.secondaryText,
        fontWeight: FontWeight.w400,
      ),
      headline3: TextStyle(
        color: AppColors.successColor,
        fontWeight: FontWeight.w400,
      ),
      headline4: TextStyle(
        height: 1.8,
        color: AppColors.secondaryText,
      ),
      headline5: TextStyle(
        height: 2.2,
        color: AppColors.secondaryText,
        fontWeight: FontWeight.w900,
      ),
      headline6: TextStyle(
        color: AppColors.secondaryText,
        fontWeight: FontWeight.w900,
      ),
      subtitle1: TextStyle(
        color: AppColors.secondaryText,
        fontWeight: FontWeight.w600,
      ),
      subtitle2: TextStyle(
        color: AppColors.grayText,
      ),
      bodyText1: TextStyle(
          height: 2.5,
          color: AppColors.primaryElement,
          fontWeight: FontWeight.w700
          // textBaseline: TextAlign.center ,
          ),
      bodyText2: TextStyle(
        color: AppColors.thirdTextDark,
        fontWeight: FontWeight.w400,
      ),
      button: TextStyle(
        color: AppColors.primaryText,
        fontWeight: FontWeight.normal,
        letterSpacing: -0.0045,
      ),
      caption: TextStyle(
        color: AppColors.hintColorDark,
        fontWeight: FontWeight.w400,
      ),
      overline: TextStyle(
        color: AppColors.secondaryText,
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}

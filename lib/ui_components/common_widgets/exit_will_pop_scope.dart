import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tap_assignment_sherif/constant/colors.dart';
import 'package:tap_assignment_sherif/utils/dimensions.dart';
import 'package:tap_assignment_sherif/utils/localizations.dart';

class PressBackTwice extends StatelessWidget {
  const PressBackTwice({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    /// for press Back Twice
    bool _firstPressed = false;
    DateTime _preBackPressTime = DateTime.now();
    return WillPopScope(
        onWillPop: () {
          ///  press Back Twice Logic by [timeGap]
          final timeGap = DateTime.now().difference(_preBackPressTime);
          final cantExit = timeGap <= const Duration(seconds: 2);
          _preBackPressTime = DateTime.now();
          if (cantExit && _firstPressed) {
            _firstPressed = false;
            // out from app
            exit(0);
          } else {
            _firstPressed = true;

            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: AppColors.primaryElement,
              duration: const Duration(seconds: 2),
              content: Text(
                AppLocalization.myLocal.backTwice,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.button?.copyWith(
                      fontSize: AppSize.titleFieldSize,
                    ),
              ),
            ));
          }
          return Future.value(false);
        },
        child: child);
  }
}

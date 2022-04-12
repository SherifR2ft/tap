import 'package:flutter/material.dart';
import 'package:tap_assignment_sherif/constant/constant_values.dart';
import 'package:tap_assignment_sherif/utils/extension/locale_right_to_left.dart';
import 'package:tap_assignment_sherif/utils/extension/nullable_extension.dart';
import 'package:tap_assignment_sherif/ui_components/common_widgets/close_button.dart';
import 'package:tap_assignment_sherif/ui_components/common_widgets/data_retrieve_error.dart';
import 'package:tap_assignment_sherif/utils/localizations.dart';
import 'package:tap_assignment_sherif/utils/dimensions.dart';
import 'package:tap_assignment_sherif/utils/extension/app_theme_mode.dart';

class DataRetrieveErrorPopUp extends StatelessWidget {
  const DataRetrieveErrorPopUp(
      {Key? key, this.message, this.fromSnackBar = false})
      : super(key: key);
  final String? message;
  final bool fromSnackBar;

  void backAction(context) {
    fromSnackBar
        ? ScaffoldMessenger.of(context).clearSnackBars()
        : Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        backAction(context);
        return Future.value(false);
      },
      child: Container(
          decoration: MediaQuery.of(context).platformBrightness.isLightMode()
              ? Constants.popUpBoxDecoration
              : Constants.popUpBoxDecorationDark,
          margin: const EdgeInsets.all(Constants.horizontalPadding),
          padding: const EdgeInsets.symmetric(
              horizontal: Constants.horizontalPadding + 2,
              vertical: Constants.horizontalPadding + 4),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: AppLocalization.myLocalUI.isRtL()
                    ? Alignment.centerLeft
                    : Alignment.centerRight,
                child: fromSnackBar
                    ? CloseButtonCustom(
                        onTap: () {
                          backAction(context);
                        },
                      )
                    : const CloseButtonCustom(),
              ),
              const SizedBox(height: 43),
              message.isNotEmptyOrNull()
                  ? DataRetrieveError(
                      message: message,
                    )
                  : const DataRetrieveError(),
              const SizedBox(
                height: 28,
              ),
              InkWell(
                onTap: () {
                  backAction(context);
                },
                child: Text(
                  AppLocalization.myLocal.okay,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontSize: AppSize.subPrimarySize,
                      ),
                ),
              )
            ],
          )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tap_assignment_sherif/constant/constant_values.dart';
import 'package:tap_assignment_sherif/ui_components/common_widgets/close_button.dart';
import 'package:tap_assignment_sherif/ui_components/common_widgets/no_internet_text.dart';
import 'package:tap_assignment_sherif/utils/localizations.dart';
import 'package:tap_assignment_sherif/utils/extension/locale_right_to_left.dart';
import 'package:tap_assignment_sherif/utils/dimensions.dart';
import 'package:tap_assignment_sherif/utils/extension/app_theme_mode.dart';

class NoInternetPopUp extends StatelessWidget {
  const NoInternetPopUp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
              child: const CloseButtonCustom(),
            ),
            const SizedBox(height: 43),
            const NoInternetConnection(),
            const SizedBox(
              height: 28,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text(
                AppLocalization.myLocal.okay,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: AppSize.subPrimarySize,
                      // textBaseline: TextAlign.center ,
                    ),
              ),
            )
          ],
        ));
  }
}

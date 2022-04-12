import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:tap_assignment_sherif/constant/constant_values.dart';
import 'package:tap_assignment_sherif/utils/localizations.dart';
import 'package:tap_assignment_sherif/utils/dimensions.dart';

class NotificationBar {
  static Future<void> showSuccessNotificationBar(context) async {
    await Flushbar(
      title: ' ',
      messageText: const _NotificationBarMessage(),
      padding: const EdgeInsets.symmetric(
          horizontal: Constants.horizontalPadding, vertical: 10),
      duration: const Duration(seconds: 5),
      backgroundColor: Theme.of(context).backgroundColor,
      flushbarPosition: FlushbarPosition.TOP,
    ).show(context);
  }
}

class _NotificationBarMessage extends StatelessWidget {
  const _NotificationBarMessage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.done,
          color: Theme.of(context).textTheme.headline3?.color,
          size: AppSize.titleFieldSize,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(AppLocalization.myLocal.addProductSuccess,
            style: Theme.of(context).textTheme.headline3?.copyWith(
                  fontSize: AppSize.subTitleFieldSize,
                )),
      ],
    );
  }
}

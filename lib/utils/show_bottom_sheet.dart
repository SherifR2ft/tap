import 'package:flutter/material.dart';
import 'package:tap_assignment_sherif/utils/extension/nullable_extension.dart';
import 'package:tap_assignment_sherif/ui_components/pop_up/data_retrieve_error_pop_up.dart';
import 'package:tap_assignment_sherif/ui_components/pop_up/no_internet_pop_up.dart';

class StatusBottomSheet {
  static Future<void> showNoInternetBottomSheet(context) async {
    await showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      enableDrag: true,
      isDismissible: true,
      useRootNavigator: true,
      isScrollControlled: true,
      builder: (context) => const NoInternetPopUp(),
    );
  }

  static Future<void> showDataRetrieveErrorBottomSheet(context,
      {String? message}) async {
    await showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      enableDrag: true,
      isDismissible: true,
      useRootNavigator: true,
      isScrollControlled: true,
      builder: (context) => message.isNotEmptyOrNull()
          ? DataRetrieveErrorPopUp(
              message: message,
            )
          : const DataRetrieveErrorPopUp(),
    );
  }
}

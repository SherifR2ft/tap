import 'package:flutter/cupertino.dart';
import 'package:tap_assignment_sherif/main.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:tap_assignment_sherif/constant/constant_shared_preferences.dart';

class AppLocalization {
  static AppLocalizations get myLocal =>
      AppLocalizations.of(navigatorKey.currentState!.overlay!.context)!;
  static Locale get myLocalUI =>
      Localizations.localeOf(navigatorKey.currentState!.overlay!.context);
}

// class AppPref {
//   static late SharedPreferences prefs;
//
//   static Future<String> get getPref async {
//     prefs = await SharedPreferences.getInstance();
//     return prefs.getString(UserData.appLocale) ?? UserData.noneAppLocale;
//   }
// }

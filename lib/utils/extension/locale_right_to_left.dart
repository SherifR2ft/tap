import 'package:flutter/cupertino.dart';

extension LocaleRtL on Locale {
  bool isRtL() {
    return languageCode == 'ar';
  }
}

extension StringNullableLocaleRtL on String? {
  bool isRtL() {
    return this == 'ar';
  }
}

extension StringLocaleRtL on String {
  bool isRtL() {
    return this == 'ar';
  }
}

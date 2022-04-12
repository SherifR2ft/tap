import 'package:flutter/cupertino.dart';

extension AppThemeMode on Brightness {
  bool isLightMode() {
    return this == Brightness.light;
  }
}

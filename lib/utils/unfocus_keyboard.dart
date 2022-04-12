import 'package:flutter/cupertino.dart';

unFocusKeyboard(context) {
  if (!FocusScope.of(context).hasPrimaryFocus &&
      FocusScope.of(context).hasFocus) {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}

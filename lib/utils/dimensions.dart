import 'package:flutter/material.dart';

class AppSize {
  /// set Default Size
  static setDefaultSize(context) {
    _widthSize = MediaQuery.of(context).size.width;
    _heightSize = MediaQuery.of(context).size.height;
    _primarySize =
        _widthSize * 0.04 - MediaQuery.textScaleFactorOf(context) + 6.5;
    if (_primarySize > 25) _primarySize = 25;
    _bottomPaddingSize = MediaQuery.of(context).padding.bottom;
    _topPaddingSize = MediaQuery.of(context).padding.top;
  }

  /// screen height
  static double _heightSize = 10; //MediaQuery.of(context).size.height

  /// screen width
  static double _widthSize = 10; //MediaQuery.of(context).size.width

  /// bottom padding as safeArea
  static double _bottomPaddingSize = 10; //MediaQuery.of(context).padding.bottom
  static double _topPaddingSize = 10; //MediaQuery.of(context).padding.bottom

  /// screen height without height of
  /// (appBar[kToolbarHeight],topPadding[_topPaddingSize],bottomPadding[_bottomPaddingSize],
  /// bottomAppBar[kBottomNavigationBarHeight],bottomAppBar icon wit text[29],bottomAppBar topPadding[5])
  static double _screenHeightOnly = _heightSize -
      _topPaddingSize -
      kToolbarHeight -
      _bottomPaddingSize -
      kBottomNavigationBarHeight -
      29 -
      5;

  ///  TEXT :-
  ///
  ///for search field [primarySize] ==> ~= 22
  static double _primarySize = 10;
  // MediaQuery.of(context).size.width * 0.04 -3 - MediaQuery.textScaleFactorOf(context);

  /// for big title [subPrimarySize] ==> ~= 18
  static double _subPrimarySize = _primarySize - 4;

  /// for title of normal fields [titleFieldSize] ==> ~= 16
  static double _titleFieldSize = _primarySize - 6;

  /// for title of normal fields [subTitleFieldSize] ==> ~= 13
  static double _subTitleFieldSize = _primarySize - 9;

  /// for normal fields [textFieldSize] ==> ~= 12
  static double _textFieldSize = _primarySize - 10;

  /// for normal fields [hintFieldSize] ==> ~= 10
  static double _hintFieldSize = _primarySize - 12;

  ///get App size
  static double get heightSize => _heightSize;
  static double get widthSize => _widthSize;
  static double get bottomPaddingSize => _bottomPaddingSize;
  static double get topPaddingSize => _topPaddingSize;
  static double get primarySize => _primarySize;
  static double get subPrimarySize => _subPrimarySize;
  static double get titleFieldSize => _titleFieldSize;
  static double get subTitleFieldSize => _subTitleFieldSize;
  static double get textFieldSize => _textFieldSize;
  static double get hintFieldSize => _hintFieldSize;
  static double get screenHeightOnly => _screenHeightOnly;
}

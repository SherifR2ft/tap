// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Manage Products`
  String get manageProducts {
    return Intl.message(
      'Manage Products',
      name: 'manageProducts',
      desc: '',
      args: [],
    );
  }

  /// `Search product`
  String get searchProduct {
    return Intl.message(
      'Search product',
      name: 'searchProduct',
      desc: '',
      args: [],
    );
  }

  /// `Search here`
  String get search {
    return Intl.message(
      'Search here',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `No internet connection !`
  String get noInternet {
    return Intl.message(
      'No internet connection !',
      name: 'noInternet',
      desc: '',
      args: [],
    );
  }

  /// `Your internet connection has been lost, please check`
  String get noInternetPara {
    return Intl.message(
      'Your internet connection has been lost, please check',
      name: 'noInternetPara',
      desc: '',
      args: [],
    );
  }

  /// `your network connection, then try again.`
  String get noInternetParb {
    return Intl.message(
      'your network connection, then try again.',
      name: 'noInternetParb',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong !!`
  String get dataRetrieveError {
    return Intl.message(
      'Something went wrong !!',
      name: 'dataRetrieveError',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong, please try again.`
  String get dataRetrieveErrorPar {
    return Intl.message(
      'Something went wrong, please try again.',
      name: 'dataRetrieveErrorPar',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message(
      'Retry',
      name: 'retry',
      desc: '',
      args: [],
    );
  }

  /// `There are no Products yet`
  String get emptyProductRequest {
    return Intl.message(
      'There are no Products yet',
      name: 'emptyProductRequest',
      desc: '',
      args: [],
    );
  }

  /// `There are no products in this search`
  String get emptySearchProductRequest {
    return Intl.message(
      'There are no products in this search',
      name: 'emptySearchProductRequest',
      desc: '',
      args: [],
    );
  }

  /// `You can add a Product`
  String get emptyProductRequestA {
    return Intl.message(
      'You can add a Product',
      name: 'emptyProductRequestA',
      desc: '',
      args: [],
    );
  }

  /// `Add Product`
  String get addProduct {
    return Intl.message(
      'Add Product',
      name: 'addProduct',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `This field can not be empty.`
  String get nonValidator {
    return Intl.message(
      'This field can not be empty.',
      name: 'nonValidator',
      desc: '',
      args: [],
    );
  }

  /// `Description field can not be empty.`
  String get productDescriptionEmptyValidator {
    return Intl.message(
      'Description field can not be empty.',
      name: 'productDescriptionEmptyValidator',
      desc: '',
      args: [],
    );
  }

  /// `Description field must be more than 2 characters.`
  String get productDescriptionValidator {
    return Intl.message(
      'Description field must be more than 2 characters.',
      name: 'productDescriptionValidator',
      desc: '',
      args: [],
    );
  }

  /// `Name field can not be empty.`
  String get productNameEmptyValidator {
    return Intl.message(
      'Name field can not be empty.',
      name: 'productNameEmptyValidator',
      desc: '',
      args: [],
    );
  }

  /// `Name field must be more than 2 characters.`
  String get productNameValidator {
    return Intl.message(
      'Name field must be more than 2 characters.',
      name: 'productNameValidator',
      desc: '',
      args: [],
    );
  }

  /// `Minimum price is 0.5`
  String get priceValidatorZero {
    return Intl.message(
      'Minimum price is 0.5',
      name: 'priceValidatorZero',
      desc: '',
      args: [],
    );
  }

  /// `Price field can not be empty.`
  String get priceValidatorEmpty {
    return Intl.message(
      'Price field can not be empty.',
      name: 'priceValidatorEmpty',
      desc: '',
      args: [],
    );
  }

  /// `K.D`
  String get kdUnit {
    return Intl.message(
      'K.D',
      name: 'kdUnit',
      desc: '',
      args: [],
    );
  }

  /// `Product Name`
  String get productNameHint {
    return Intl.message(
      'Product Name',
      name: 'productNameHint',
      desc: '',
      args: [],
    );
  }

  /// `Product Price`
  String get productPriceHint {
    return Intl.message(
      'Product Price',
      name: 'productPriceHint',
      desc: '',
      args: [],
    );
  }

  /// `Product Description`
  String get productDescriptionHint {
    return Intl.message(
      'Product Description',
      name: 'productDescriptionHint',
      desc: '',
      args: [],
    );
  }

  /// `Okay`
  String get okay {
    return Intl.message(
      'Okay',
      name: 'okay',
      desc: '',
      args: [],
    );
  }

  /// `Product wa added successfully`
  String get addProductSuccess {
    return Intl.message(
      'Product wa added successfully',
      name: 'addProductSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Press the back button twice to exit the program`
  String get backTwice {
    return Intl.message(
      'Press the back button twice to exit the program',
      name: 'backTwice',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

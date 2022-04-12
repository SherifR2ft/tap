// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "addProduct": MessageLookupByLibrary.simpleMessage("Add Product"),
        "addProductSuccess": MessageLookupByLibrary.simpleMessage(
            "Product wa added successfully"),
        "backTwice": MessageLookupByLibrary.simpleMessage(
            "Press the back button twice to exit the program"),
        "dataRetrieveError":
            MessageLookupByLibrary.simpleMessage("Something went wrong !!"),
        "dataRetrieveErrorPar": MessageLookupByLibrary.simpleMessage(
            "Something went wrong, please try again."),
        "emptyProductRequest":
            MessageLookupByLibrary.simpleMessage("There are no Products yet"),
        "emptyProductRequestA":
            MessageLookupByLibrary.simpleMessage("You can add a Product"),
        "emptySearchProductRequest": MessageLookupByLibrary.simpleMessage(
            "There are no products in this search"),
        "kdUnit": MessageLookupByLibrary.simpleMessage("K.D"),
        "manageProducts":
            MessageLookupByLibrary.simpleMessage("Manage Products"),
        "noInternet":
            MessageLookupByLibrary.simpleMessage("No internet connection !"),
        "noInternetPara": MessageLookupByLibrary.simpleMessage(
            "Your internet connection has been lost, please check"),
        "noInternetParb": MessageLookupByLibrary.simpleMessage(
            "your network connection, then try again."),
        "nonValidator": MessageLookupByLibrary.simpleMessage(
            "This field can not be empty."),
        "okay": MessageLookupByLibrary.simpleMessage("Okay"),
        "priceValidatorEmpty": MessageLookupByLibrary.simpleMessage(
            "Price field can not be empty."),
        "priceValidatorZero":
            MessageLookupByLibrary.simpleMessage("Minimum price is 0.5"),
        "productDescriptionEmptyValidator":
            MessageLookupByLibrary.simpleMessage(
                "Description field can not be empty."),
        "productDescriptionHint":
            MessageLookupByLibrary.simpleMessage("Product Description"),
        "productDescriptionValidator": MessageLookupByLibrary.simpleMessage(
            "Description field must be more than 2 characters."),
        "productNameEmptyValidator": MessageLookupByLibrary.simpleMessage(
            "Name field can not be empty."),
        "productNameHint": MessageLookupByLibrary.simpleMessage("Product Name"),
        "productNameValidator": MessageLookupByLibrary.simpleMessage(
            "Name field must be more than 2 characters."),
        "productPriceHint":
            MessageLookupByLibrary.simpleMessage("Product Price"),
        "retry": MessageLookupByLibrary.simpleMessage("Retry"),
        "search": MessageLookupByLibrary.simpleMessage("Search here"),
        "searchProduct": MessageLookupByLibrary.simpleMessage("Search product"),
        "submit": MessageLookupByLibrary.simpleMessage("Submit")
      };
}

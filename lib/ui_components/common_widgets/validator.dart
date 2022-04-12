import 'package:tap_assignment_sherif/utils/localizations.dart';

class ValidateText {
  static const singletonValidator = _Validator();
}

enum ValidatorTypes { productName, productDescription, price }

class _Validator {
  const _Validator();

  String? validateText({ValidatorTypes? textType, var value}) {
    if (textType == null) _nonValidator(value);
    switch (textType) {
      case ValidatorTypes.productDescription:
        return _productDescriptionValidator(value);
      case ValidatorTypes.productName:
        return _productNameValidatorPackage(value);
      case ValidatorTypes.price:
        return _priceValidatorPackage(value);
      default:
        return _nonValidator(value);
    }
  }

  String? _productNameValidatorPackage(String? value) =>
      (value?.isEmpty ?? true)
          ? AppLocalization.myLocal.productNameEmptyValidator
          : value!.length < 3
              ? AppLocalization.myLocal.productNameValidator
              : null;

  String? _priceValidatorPackage(String? value) => (value?.isEmpty ?? true)
      ? AppLocalization.myLocal.priceValidatorEmpty
      : ((double.tryParse(value!) ?? 0) <= 0.49)
          ? AppLocalization.myLocal.priceValidatorZero
          : null;

  String? _productDescriptionValidator(String? value) =>
      (value?.isEmpty ?? true)
          ? AppLocalization.myLocal.productDescriptionEmptyValidator
          : value!.length < 3
              ? AppLocalization.myLocal.productDescriptionValidator
              : null;

  String? _nonValidator(var value) =>
      (value.isEmpty) ? AppLocalization.myLocal.nonValidator : null;
}

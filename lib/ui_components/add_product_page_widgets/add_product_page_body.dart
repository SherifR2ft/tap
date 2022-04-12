import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tap_assignment_sherif/constant/constant_values.dart';
import 'package:tap_assignment_sherif/providers/add_product_provider.dart';
import 'package:tap_assignment_sherif/ui_components/add_product_page_widgets/add_product_form_template.dart';
import 'package:tap_assignment_sherif/ui_components/add_product_page_widgets/add_product_text_field.dart';
import 'package:tap_assignment_sherif/ui_components/add_product_page_widgets/text_field_list_template.dart';
import 'package:tap_assignment_sherif/ui_components/common_widgets/suffix_text_icon.dart';
import 'package:tap_assignment_sherif/ui_components/common_widgets/validator.dart';
import 'package:tap_assignment_sherif/utils/localizations.dart';
import 'package:tap_assignment_sherif/utils/extension/nullable_extension.dart';

class AddProductForm extends StatefulWidget {
  const AddProductForm({Key? key}) : super(key: key);

  @override
  _AddProductFormState createState() => _AddProductFormState();
}

class _AddProductFormState extends State<AddProductForm> {
  ConnectivityResult? _connectionStatus;

  final _formKey = GlobalKey<FormState>();

  // TextEditingControllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  // initialize at {initState}
  late ValueNotifier<bool> _disableButton;

  /// for disabling or activating button , not for field it self
  /// if we add new field we need to add its validator also
  bool get _isNotValid =>
      ValidateText.singletonValidator
          .validateText(
              textType: ValidatorTypes.productName, value: _nameController.text)
          .isNotEmptyOrNull() ||
      ValidateText.singletonValidator
          .validateText(
              textType: ValidatorTypes.price, value: _priceController.text)
          .isNotEmptyOrNull() ||
      ValidateText.singletonValidator
          .validateText(
              textType: ValidatorTypes.productDescription,
              value: _descriptionController.text)
          .isNotEmptyOrNull();

  @override
  void initState() {
    _disableButton = ValueNotifier<bool>(true);

    _disableButton.addListener(() {
      _disableButton.value = _isNotValid;
      // to remove error text at fields
      if (!_disableButton.value) _formKey.currentState?.validate();
    });
    super.initState();
  }

  @override
  void dispose() {
    // TextEditingControllers
    _nameController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    // ValueNotifier
    _disableButton.removeListener(() {});
    _disableButton.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _connectionStatus = Provider.of<ConnectivityResult>(context);
    return AddProductFormTemplate(
      formKey: _formKey,
      onFormChanged: () {
        // update button UI
        _disableButton.notifyListeners();
      },
      body: TextFieldListTemplate(children: [
        //name
        TextFieldAddProduct(
          hintText: AppLocalization.myLocal.productNameHint,
          validateTextType: ValidatorTypes.productName,
          textController: _nameController,
        ),
        // description
        TextFieldAddProduct(
          hintText: AppLocalization.myLocal.productDescriptionHint,
          validateTextType: ValidatorTypes.productDescription,
          textController: _descriptionController,
        ),
        // price
        TextFieldAddProduct(
          hintText: AppLocalization.myLocal.productPriceHint,
          validateTextType: ValidatorTypes.price,
          textController: _priceController,
          suffixIcon: SuffixIconText(
            suffixText: AppLocalization.myLocal.kdUnit,
          ),
          inputType: Constants.positiveDecimalNumber,
          numberOnly: true,
        ),
      ]),
      disableButtonListenable: _disableButton,
      buttonFunc: (disableValue) async {
        if (disableValue) {
          _formKey.currentState?.validate();
        } else {
          // push to firebase database
          Provider.of<AddProductProvider>(context, listen: false).addProduct(
              connectionStatus: _connectionStatus,
              description: _descriptionController.text,
              name: _nameController.text,
              price: _priceController.text);
        }
      },
      buttonTitle: AppLocalization.myLocal.submit,
    );
  }
}

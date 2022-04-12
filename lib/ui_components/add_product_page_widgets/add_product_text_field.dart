import 'package:tap_assignment_sherif/constant/constant_values.dart';
import 'package:tap_assignment_sherif/ui_components/common_widgets/suffix_text_icon.dart';
import 'package:tap_assignment_sherif/ui_components/common_widgets/text_normal_field.dart';
import 'package:flutter/material.dart';
import 'package:tap_assignment_sherif/ui_components/common_widgets/validator.dart';

class TextFieldAddProduct extends StatelessWidget {
  const TextFieldAddProduct(
      {Key? key,
      required this.hintText,
      required this.validateTextType,
      this.inputType,
      this.numberOnly = false,
      this.suffixIcon,
      required this.textController})
      : super(key: key);

  final String hintText;
  final ValidatorTypes validateTextType;
  final TextEditingController textController;
  final SuffixIconText? suffixIcon;
  final TextInputType? inputType;
  final bool numberOnly;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(vertical: Constants.fieldsPadding / 2),
      child: NormalTextField(
        hintText: hintText,
        validateTextType: validateTextType,
        textController: textController,
        suffixIcon: suffixIcon,
        inputType: inputType,
        numberOnly: numberOnly,
      ),
    );
  }
}

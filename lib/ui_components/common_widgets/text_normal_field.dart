import 'package:flutter/material.dart';

import 'package:tap_assignment_sherif/constant/constant_values.dart';
import 'package:tap_assignment_sherif/ui_components/common_widgets/validator.dart';
import 'package:tap_assignment_sherif/utils/dimensions.dart';

class NormalTextField extends StatelessWidget {
  const NormalTextField(
      {this.validateText,
      this.hintText,
      this.prefixIcon,
      this.suffixIcon,
      this.validateTextType,
      this.maxLines,
      this.textController,
      this.onChanged,
      this.onTap,
      this.inputType,
      this.validatorEnabled = true,
      this.fillColor,
      this.autoFocus = false,
      this.numberOnly = false,
      Key? key})
      : super(key: key);

  final ValidateText? validateText;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final ValidatorTypes? validateTextType;
  final Color? fillColor;
  final int? maxLines;
  final TextEditingController? textController;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final TextInputType? inputType;
  final bool numberOnly;
  final bool validatorEnabled;
  final bool autoFocus;

  /// TextFormField height
  /// without counterText   => 48
  /// with counterText (24) => 72
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      onChanged: onChanged,
      autofocus: autoFocus,
      keyboardType: inputType,
      textAlign: TextAlign.start,
      validator: validatorEnabled
          ? (_value) => ValidateText.singletonValidator
              .validateText(textType: validateTextType, value: _value)
          : null,
      decoration: InputDecoration(
        fillColor: fillColor ?? Theme.of(context).backgroundColor,
        filled: true,
        // counterText add padding => 24
        counterText: ' ',
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon != null
            ? Center(
                widthFactor: 0,
                child: suffixIcon!,
              )
            : null,
        hintText: hintText,
        labelText: hintText,
        floatingLabelStyle: Theme.of(context)
            .textTheme
            .headline4
            ?.copyWith(height: 1, fontSize: AppSize.textFieldSize),
        alignLabelWithHint: true,
        hintStyle: Theme.of(context)
            .textTheme
            .caption
            ?.copyWith(fontSize: AppSize.textFieldSize),
        errorStyle: TextStyle(fontSize: AppSize.hintFieldSize),
        contentPadding: const EdgeInsets.all(13),
        border: Constants.textFieldBorder,
        enabledBorder: Constants.enabledBorder,
        disabledBorder: Constants.disabledBorder,
        focusedBorder: Constants.focusedBorder,
      ),
      inputFormatters: (numberOnly) ? Constants.numberInputFormatter : [],
      style: Theme.of(context)
          .textTheme
          .headline1
          ?.copyWith(fontSize: AppSize.textFieldSize),
      maxLines: maxLines ?? 1,
      autocorrect: false,
      onTap: onTap,
    );
  }
}

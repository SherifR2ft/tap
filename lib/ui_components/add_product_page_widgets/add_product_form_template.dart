import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tap_assignment_sherif/constant/constant_values.dart';
import 'package:tap_assignment_sherif/ui_components/add_product_page_widgets/text_field_list_template.dart';
import 'package:tap_assignment_sherif/ui_components/common_widgets/primary_button.dart';

class AddProductFormTemplate extends StatelessWidget {
  const AddProductFormTemplate(
      {Key? key,
      required this.body,
      required this.formKey,
      required this.buttonFunc,
      required this.buttonTitle,
      required this.disableButtonListenable,
      required this.onFormChanged})
      : super(key: key);

  final Function() onFormChanged;
  final Key formKey;
  final TextFieldListTemplate body;
  final String buttonTitle;
  final Function(bool) buttonFunc;
  final ValueListenable<bool> disableButtonListenable;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: Constants.horizontalPadding),
      child: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.disabled,
        onChanged: onFormChanged,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              // {48} => height of {TextField} without {counterText}
              height: 48,
            ),
            Flexible(child: body),
            ValueListenableBuilder<bool>(
              valueListenable: disableButtonListenable,
              builder: (context, bool disableValue, child) => Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: Constants.horizontalPadding),
                child: PrimaryButton(
                    title: buttonTitle,
                    disable: disableValue,
                    func: () => buttonFunc(disableValue)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

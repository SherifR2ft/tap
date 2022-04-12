import 'package:flutter/material.dart';
import 'package:tap_assignment_sherif/ui_components/add_product_page_widgets/add_product_text_field.dart';

class TextFieldListTemplate extends StatelessWidget {
  const TextFieldListTemplate({Key? key, required this.children})
      : super(key: key);
  final List<TextFieldAddProduct> children;
  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ...children,
          SizedBox(
            height: mediaQuery.viewInsets.bottom > 50
                ? mediaQuery.viewInsets.bottom
                : 1, //,
          )
        ],
      ),
    );
  }
}

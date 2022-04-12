import 'package:flutter/material.dart';
import 'package:tap_assignment_sherif/ui_components/common_widgets/bottom_button.dart';
import 'package:tap_assignment_sherif/ui_components/common_widgets/exit_will_pop_scope.dart';
import 'package:tap_assignment_sherif/ui_components/common_widgets/page_header_template.dart';
import 'package:tap_assignment_sherif/ui_components/product_list_page_widgets/products_list_body_template.dart';

class ProductsListPageTemplate extends StatelessWidget {
  const ProductsListPageTemplate(
      {Key? key,
      required this.header,
      required this.body,
      required this.footer})
      : super(key: key);

  final PageHeaderTemplate header;
  final ProductsListBodyTemplate body;
  final BottomButton footer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: header,
      body: PressBackTwice(
        child: Stack(children: [body, footer]),
      ),
    );
  }
}

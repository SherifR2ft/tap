import 'package:flutter/material.dart';
import 'package:tap_assignment_sherif/ui_components/add_product_page_widgets/add_product_page_body.dart';
import 'package:tap_assignment_sherif/ui_components/pages/add_product_page_templete.dart';
import 'package:tap_assignment_sherif/utils/localizations.dart';

class AddProductPage extends StatelessWidget {
  const AddProductPage({Key? key}) : super(key: key);

  static const route = '/AddProductPage';

  @override
  Widget build(BuildContext context) {
    return AddProductPageTemplate(
      headerTitle: AppLocalization.myLocal.addProduct,
      body: const AddProductForm(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tap_assignment_sherif/providers/add_product_provider.dart';
import 'package:tap_assignment_sherif/ui_components/add_product_page_widgets/add_product_page_body.dart';
import 'package:tap_assignment_sherif/ui_components/common_widgets/page_header_template.dart';
import 'package:tap_assignment_sherif/ui_components/common_widgets/undismissible_spinner.dart';

class AddProductPageTemplate extends StatelessWidget {
  const AddProductPageTemplate(
      {Key? key, required this.headerTitle, required this.body})
      : super(key: key);

  final String headerTitle;
  final AddProductForm body;
  @override
  Widget build(BuildContext context) {
    return Selector<AddProductProvider, bool>(
      // user must wait until pushing data success, failed or timeout.
      child: const UnDismissibleSpinner(),
      selector: (buildContext, modelProvider) => modelProvider.isLoading,
      builder: (context, isLoading, child) => Scaffold(
        appBar: PageHeaderTemplate(
          title: headerTitle,
          hasBackButton: !isLoading,
        ),
        body: isLoading ? child! : body,
      ),
    );
  }
}

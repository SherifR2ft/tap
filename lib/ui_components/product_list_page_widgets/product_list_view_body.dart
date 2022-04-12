import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tap_assignment_sherif/providers/product_list_provider.dart';
import 'package:tap_assignment_sherif/ui_components/product_list_page_widgets/product_list_view_body_template.dart';

class ProductListViewBody extends StatelessWidget {
  const ProductListViewBody({Key? key, required this.clearTextControllerFunc})
      : super(key: key);

  final Function() clearTextControllerFunc;

  @override
  Widget build(BuildContext context) {
    return ProductListViewBodyTemplate(
      onPullToRefresh: (ConnectivityResult? _connectionStatus) async {
        clearTextControllerFunc();
        await Provider.of<ProductListProvider>(context, listen: false)
            .handlePullToRefresh(connectionStatus: _connectionStatus);
      },
      refreshFunction: (ConnectivityResult? _connectionStatus) {
        clearTextControllerFunc();
        Provider.of<ProductListProvider>(context, listen: false)
            .refreshFunction(connectionStatus: _connectionStatus);
      },
    );
  }
}

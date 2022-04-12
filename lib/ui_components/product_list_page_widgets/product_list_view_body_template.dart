import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tap_assignment_sherif/ui_components/product_list_page_widgets/products_builder.dart';

class ProductListViewBodyTemplate extends StatelessWidget {
  const ProductListViewBodyTemplate({
    Key? key,
    required this.onPullToRefresh,
    required this.refreshFunction,
  }) : super(key: key);

  final Future<void> Function(ConnectivityResult?) onPullToRefresh;
  final Function(ConnectivityResult?) refreshFunction;

  @override
  Widget build(BuildContext context) {
    final ConnectivityResult? _connectionStatus =
        Provider.of<ConnectivityResult>(context);
    return RefreshIndicator(
        color: Theme.of(context).indicatorColor,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        onRefresh: () async {
          onPullToRefresh(_connectionStatus);
        }, //_handleRefresh,
        child: ProductsBuilderTemplate(
          connectionStatus: _connectionStatus,
          refreshFunction: refreshFunction,
        ));
  }
}

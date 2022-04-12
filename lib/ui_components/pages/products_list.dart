import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tap_assignment_sherif/providers/product_list_provider.dart';
import 'package:tap_assignment_sherif/ui_components/common_widgets/bottom_button.dart';
import 'package:tap_assignment_sherif/ui_components/common_widgets/page_header_template.dart';
import 'package:tap_assignment_sherif/ui_components/common_widgets/search_field.dart';
import 'package:tap_assignment_sherif/ui_components/pages/add_product.dart';
import 'package:tap_assignment_sherif/ui_components/pages/products_list_templete.dart';
import 'package:tap_assignment_sherif/ui_components/product_list_page_widgets/product_list_view_body.dart';
import 'package:tap_assignment_sherif/ui_components/product_list_page_widgets/products_list_body_template.dart';
import 'package:tap_assignment_sherif/utils/localizations.dart';
import 'package:tap_assignment_sherif/utils/show_notification_bar.dart';

class ProductsListPage extends StatefulWidget {
  const ProductsListPage({Key? key}) : super(key: key);

  static const route = '/ProductsListPage';

  @override
  State<ProductsListPage> createState() => _ProductsListPageState();
}

class _ProductsListPageState extends State<ProductsListPage> {
  final _searchTextController = TextEditingController();

  ConnectivityResult? _connectionStatus;

  void _addProductButton() async {
    _searchTextController.clear();
    bool? needRefresh;
    await Navigator.pushNamed(context, AddProductPage.route)
        .then((value) => needRefresh = value as bool?);
    if (needRefresh ?? false) {
      NotificationBar.showSuccessNotificationBar(context);
      Provider.of<ProductListProvider>(context, listen: false)
          .refreshFunction(connectionStatus: _connectionStatus);
    }
  }

  @override
  void initState() {
    Provider.of<ProductListProvider>(context, listen: false)
        .initDataProductRequests(connectionStatus: _connectionStatus);
    super.initState();
  }

  @override
  void dispose() {
    _searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _connectionStatus = Provider.of<ConnectivityResult>(context);
    return ProductsListPageTemplate(
      header: PageHeaderTemplate(
        title: AppLocalization.myLocal.manageProducts,
      ),
      body: ProductsListBodyTemplate(
        header: SearchField(
            searchTextController: _searchTextController,
            onSearching: () =>
                Provider.of<ProductListProvider>(context, listen: false)
                    .onSearching(
                        connectionStatus: _connectionStatus,
                        searchKeyWord: _searchTextController.text),
            hint: AppLocalization.myLocal.searchProduct),
        body: ProductListViewBody(
            clearTextControllerFunc: _searchTextController.clear),
      ),
      footer: BottomButton(
          title: AppLocalization.myLocal.addProduct, func: _addProductButton),
    );
  }
}

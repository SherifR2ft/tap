import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tap_assignment_sherif/network_layers/product/product_list_base.dart';
import 'package:tap_assignment_sherif/providers/product_list_provider.dart';
import 'package:tap_assignment_sherif/ui_components/common_widgets/data_retrieve_error.dart';
import 'package:tap_assignment_sherif/ui_components/common_widgets/empty_state.dart';
import 'package:tap_assignment_sherif/ui_components/common_widgets/no_internet_text.dart';
import 'package:tap_assignment_sherif/ui_components/common_widgets/spinner.dart';
import 'package:tap_assignment_sherif/ui_components/product_list_page_widgets/products_list_view.dart';
import 'package:tap_assignment_sherif/utils/localizations.dart';

class ProductsBuilderTemplate extends StatelessWidget {
  const ProductsBuilderTemplate({
    Key? key,
    required this.connectionStatus,
    required this.refreshFunction,
  }) : super(key: key);

  final ConnectivityResult? connectionStatus;
  final Function(ConnectivityResult?) refreshFunction;

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductListProvider>(
      child: const SpinnerDefault(),
      builder: (context, providerValue, spinnerDefault) =>
          FutureBuilder<List<ProductItemData>?>(
        future: providerValue.dataProductRequests,
        builder: (context, snapshot) {
          if (connectionStatus == ConnectivityResult.none) {
            return const NoInternetConnection(
              isScroll: false,
            );
          }
          if (providerValue.refreshSpinner) {
            return spinnerDefault!;
          } else {
            if (snapshot.hasError ||
                !snapshot.hasData &&
                    snapshot.connectionState == ConnectionState.done) {
              return DataRetrieveError(
                isScroll: true,
                refreshFunction: () {
                  refreshFunction(connectionStatus);
                },
              );
            }
            if (snapshot.hasData) {
              if (snapshot.data?.isEmpty ?? true) {
                return providerValue.dataProductSearchingListIsNotEmpty
                    ? EmptyState(
                        baseText:
                            AppLocalization.myLocal.emptySearchProductRequest,
                      )
                    : EmptyState(
                        baseText: AppLocalization.myLocal.emptyProductRequest,
                        subTextA: AppLocalization.myLocal.emptyProductRequestA,
                      );
              } else {
                return ProductsListView(
                  productsData: snapshot.data!,
                );
              }
            } else {
              return spinnerDefault!;
            }
          }
        },
      ),
    );
  }
}

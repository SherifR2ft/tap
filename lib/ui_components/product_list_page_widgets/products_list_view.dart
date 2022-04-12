import 'package:flutter/cupertino.dart';
import 'package:tap_assignment_sherif/constant/constant_values.dart';
import 'package:tap_assignment_sherif/network_layers/product/product_list_base.dart';
import 'package:tap_assignment_sherif/ui_components/product_list_page_widgets/product_item.dart';

class ProductsListView extends StatelessWidget {
  const ProductsListView({Key? key, required this.productsData})
      : productsLength = productsData.length,
        super(key: key);

  final List<ProductItemData> productsData;
  final int productsLength;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // {+1} to make last item appear on button
      // by adding extra  item
      itemCount: productsLength + 1,
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(
          vertical: 10, horizontal: Constants.horizontalPadding),
      primary: false,
      addAutomaticKeepAlives: true,
      scrollDirection: Axis.vertical,

      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 7.0),
        child:
            // to make last item appear on button
            // by add[buttonHeight] to extra item
            index == productsLength
                ? const SizedBox(height: Constants.buttonHeight)
                : ProductItem(productData: productsData[index]),
      ),
    );
  }
}

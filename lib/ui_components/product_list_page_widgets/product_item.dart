import 'package:flutter/material.dart';
import 'package:tap_assignment_sherif/constant/constant_values.dart';
import 'package:tap_assignment_sherif/network_layers/product/product_list_base.dart';
import 'package:tap_assignment_sherif/ui_components/product_list_page_widgets/product_item_text_fields.dart';
import 'package:tap_assignment_sherif/utils/extension/app_theme_mode.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key, required this.productData}) : super(key: key);
  final ProductItemData productData;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: MediaQuery.of(context).platformBrightness.isLightMode()
          ? Constants.primaryContainerBoxDecoration
          : Constants.primaryDarkContainerBoxDecoration,
      padding: const EdgeInsets.all(Constants.horizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TitleText(title: productData.productData.name),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 7.0),
            child: DescriptionText(
                description: productData.productData.description),
          ),
          PriceText(price: productData.productData.price),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tap_assignment_sherif/ui_components/common_widgets/search_field.dart';
import 'package:tap_assignment_sherif/ui_components/product_list_page_widgets/product_list_view_body.dart';

class ProductsListBodyTemplate extends StatelessWidget {
  const ProductsListBodyTemplate(
      {Key? key, required this.header, required this.body})
      : super(key: key);

  final SearchField? header;
  final ProductListViewBody body;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (header != null) header!,
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: body,
        ),
      ],
    );
  }
}

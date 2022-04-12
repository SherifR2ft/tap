import 'package:flutter/material.dart';
import 'package:tap_assignment_sherif/ui_components/pages/products_list.dart';
import 'package:tap_assignment_sherif/utils/setup_app_configuration.dart';

class AppInitRoute extends StatelessWidget {
  const AppInitRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppConfiguration.setupAppConfiguration(context);
    return const ProductsListPage();
  }
}

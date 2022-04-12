import 'package:tap_assignment_sherif/network_layers/network_base/network_mappers.dart';
import 'package:tap_assignment_sherif/network_layers/product/product_list_base.dart';

class ProductsListResponse extends ListMappable {
  late final ProductsListBase? products;

  @override
  Mappable fromJsonList(List json) {
    products = ProductsListBase.fromJson(json);
    return this;
  }
}

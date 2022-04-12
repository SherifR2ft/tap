import 'package:tap_assignment_sherif/network_layers/network_base/network_mappers.dart';
import 'package:tap_assignment_sherif/network_layers/product/product_list_base.dart';

class AddProductRequest extends RequestMappable {
  final String name;
  final String desc;
  final String price;
  final String createdAt;

  AddProductRequest({
    required this.price,
    required this.name,
    required this.desc,
    required this.createdAt,
  });

  @override
  Map<String, dynamic> toJson() => {
        'product_data':
            ProductData(name: name, price: price, description: desc).toJson(),
        'created_at': createdAt,
      };
}

import 'dart:convert';

class ProductsListBase {
  ProductsListBase({
    this.productsList,
  });

  final List<ProductItemData>? productsList;

  factory ProductsListBase.fromRawJson(String str) =>
      ProductsListBase.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductsListBase.fromJson(List<dynamic> json) => ProductsListBase(
        productsList: json.isEmpty
            ? null
            : List<ProductItemData>.from(
                json.map((x) => ProductItemData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'products': productsList == null
            ? null
            : List<dynamic>.from(productsList?.map((x) => x.toJson()) ?? []),
      };
}

class ProductItemData {
  ProductItemData({
    required this.productData,
    required this.createdAt,
  });

  final ProductData productData;
  final String createdAt;

  factory ProductItemData.fromRawJson(String str) =>
      ProductItemData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductItemData.fromJson(Map<String, dynamic> json) =>
      ProductItemData(
        productData: ProductData.fromJson(json["product_data"]),
        createdAt: json["created_at"],
      );

  Map<String, dynamic> toJson() => {
        "product_data": productData.toJson(),
        "created_at": createdAt,
      };
}

class ProductData {
  ProductData({
    required this.name,
    required this.description,
    required this.price,
  });

  final String name;
  final String description;
  final String price;

  factory ProductData.fromRawJson(String str) =>
      ProductData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductData.fromJson(Map<String, dynamic> json) => ProductData(
        name: json["name"],
        description: json["description"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "price": price,
        "description": description,
      };
}

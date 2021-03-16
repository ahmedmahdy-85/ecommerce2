import 'package:ecommerce/helper/extension.dart';
import 'package:flutter/cupertino.dart';

class ProductModel {
  String name;
  String image;
  String brand;
  String price;
  Color color;
  String details;
  String size;
  String productId;
  ProductModel(
      {this.name,
      this.image,
      this.brand,
      this.price,
      this.details,
      this.size,
      this.productId,
      this.color});

  ProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map['name'];
    image = map['image'];
    brand = map['brand'];
    price = map['price'];
    color = HexColor.fromHex(map['color']);
    details = map['details'];
    size = map['size'];
    productId = map['productId'];
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'brand': brand,
      'price': price,
      'size': size,
      'details': details,
      'color': color,
      'productId': productId,
    };
  }
}

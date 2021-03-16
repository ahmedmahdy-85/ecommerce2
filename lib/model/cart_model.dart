class CartModel {
  String image;
  String name;
  String price;
  int quantity;
  String id;

  CartModel({this.name, this.quantity, this.price, this.image, this.id});

  toJson() {
    return {
      'image': image,
      'name': name,
      'price': price,
      'quantity': quantity,
      'id': id
    };
  }

  CartModel.fromJson(Map<String, dynamic> map) {
    image = map['image'];
    name = map['name'];
    price = map['price'];
    quantity = map['quantity'];
    id = map['id'];
  }
}

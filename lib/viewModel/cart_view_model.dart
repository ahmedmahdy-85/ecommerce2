import 'package:ecommerce/services/database/cart_database_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ecommerce/model/cart_model.dart';

class CartViewModel extends GetxController {
  ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;
  List<CartModel> _cartProducts = [];
  List<CartModel> get cartProducts => _cartProducts;
  double _totalPayment = 0;
  double get totalPayment => _totalPayment;
  var dbHelper = CartDatabaseHelper.db;

  CartViewModel() {
    getFromCart();
  }

  Future<void> getFromCart() async {
    _loading.value = true;
    _cartProducts = await dbHelper.getAllProducts();
    _loading.value = false;

    getTotalPayment();
    update();
  }

  void getTotalPayment() {
    for (int i = 0; i < _cartProducts.length; i++) {
      _totalPayment +=
          (double.parse(_cartProducts[i].price) * _cartProducts[i].quantity);
      print(_totalPayment);
      update();
    }
  }

  void addToCart(CartModel cartModel) async {
    for (int i = 0; i < _cartProducts.length; i++) {
      if (_cartProducts[i].id == cartModel.id) {
        return;
      }
    }

    await dbHelper.insertProduct(cartModel);
    _cartProducts.add(cartModel);
    _totalPayment += (double.parse(cartModel.price) * cartModel.quantity);
    update();
  }

  void increaseQuantity(int index) async {
    _cartProducts[index].quantity++;
    _totalPayment += (double.parse(_cartProducts[index].price));
    await dbHelper.updateProduct(_cartProducts[index]);
    update();
  }

  void decreaseQuantity(int index) async {
    if (_cartProducts[index].quantity > 1) {
      _cartProducts[index].quantity--;
      _totalPayment -= (double.parse(_cartProducts[index].price));
      await dbHelper.updateProduct(_cartProducts[index]);
      update();
    }
  }
}

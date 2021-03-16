import 'package:ecommerce/model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ecommerce/services/home_service.dart';
import 'package:ecommerce/model/category_model.dart';
import 'package:ecommerce/services/best_selling_service.dart';

class HomeViewModel extends GetxController {
  ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;
  List<CategoryModel> _categories = [];
  List<CategoryModel> get categories => _categories;
  List<ProductModel> _bestSelling = [];
  List<ProductModel> get bestSelling => _bestSelling;

  HomeViewModel() {
    getCategory();
    getBestSelling();
  }

  Future<void> getCategory() async {
    _loading.value = true;
    await HomeService().getCategorization().then((value) {
      for (int i = 0; i < value.length; i++) {
        _categories.add(CategoryModel.fromJson(value[i].data()));
      }
      _loading.value = false;
      update();
    });
  }

  Future<void> getBestSelling() async {
    _loading.value = true;
    await BestSellingService().getProducts().then((value) {
      for (int i = 0; i < value.length; i++) {
        _bestSelling.add(ProductModel.fromJson(value[i].data()));
      }
      _loading.value = false;
      update();
    });
  }
}

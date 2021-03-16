import 'package:ecommerce/helper/constants.dart';
import 'package:ecommerce/view/control_view.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/helper/enum.dart';

class CheckoutViewModel extends GetxController {
  int _index = 0;
  int get index => _index;
  Pages _pages = Pages.DeliveryTime;
  Pages get pages => _pages;

  void changeIndex(int i) {
    _index = i;
    if (_index == 1) {
      _pages = Pages.AddAddress;
    } else if (_index == 2) {
      _pages = Pages.Summary;
    } else {
      Get.to(ControlView());
    }
    update();
  }

  Color getColor(int i) {
    if (i == _index) {
      return inProgressColor;
    } else if (i < _index) {
      return Colors.green;
    } else {
      return todoColor;
    }
  }
}

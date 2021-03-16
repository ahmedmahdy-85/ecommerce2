import 'package:get/get.dart';
import 'package:ecommerce/view/home_screen.dart';
import 'package:ecommerce/view/cart_view.dart';
import 'package:ecommerce/view/profile_view.dart';
import 'package:flutter/material.dart';

class ControlViewModel extends GetxController {
  int _navigatorValue = 0;
  int get navigatorValue => _navigatorValue;
  Widget _currentScreen = HomeScreen();
  Widget get currentScreen => _currentScreen;

  void changeSelectedValue(int selectedValue) {
    _navigatorValue = selectedValue;
    switch (selectedValue) {
      case 0:
        {
          _currentScreen = HomeScreen();
          break;
        }
      case 1:
        {
          _currentScreen = CartView();
          break;
        }
      case 2:
        {
          _currentScreen = ProfileView();
          break;
        }
    }
    update();
  }
}

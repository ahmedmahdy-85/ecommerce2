import 'package:ecommerce/viewModel/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/view/authentication/login.dart';
import 'package:ecommerce/viewModel/control_view_model.dart';

class ControlView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControlViewModel>(
      init: Get.find(),
      builder: (controller) => Obx(() {
        return (Get.find<AuthViewModel>().user == null)
            ? LoginScreen()
            : GetBuilder<ControlViewModel>(
                init: Get.find(),
                builder: (controller) => Scaffold(
                  body: controller.currentScreen,
                  bottomNavigationBar: bottomNavigationBar(),
                ),
              );
      }),
    );
  }

  Widget bottomNavigationBar() {
    return GetBuilder<ControlViewModel>(
      init: Get.find(),
      builder: (controller) => BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              activeIcon: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text(
                  'Explore',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              label: '',
              icon: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Image.asset(
                  'assets/images/explore.png',
                  fit: BoxFit.contain,
                  width: 7.0,
                ),
              )),
          BottomNavigationBarItem(
              activeIcon: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text('Cart'),
              ),
              label: '',
              icon: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Image.asset(
                  'assets/images/cart.png',
                  fit: BoxFit.contain,
                  width: 22.0,
                ),
              )),
          BottomNavigationBarItem(
              activeIcon: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text('Profile'),
              ),
              label: '',
              icon: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Image.asset(
                  'assets/images/profile.png',
                  fit: BoxFit.contain,
                  width: 22.0,
                ),
              )),
        ],
        currentIndex: controller.navigatorValue,
        onTap: (index) {
          controller.changeSelectedValue(index);
        },
        elevation: 0.0,
        backgroundColor: Colors.grey.shade100,
        selectedItemColor: Colors.black,
      ),
    );
  }
}

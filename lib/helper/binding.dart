import 'package:ecommerce/helper/local_storage_data.dart';
import 'package:ecommerce/viewModel/auth_view_model.dart';
import 'package:ecommerce/viewModel/checkout_view_model.dart';
import 'package:ecommerce/viewModel/control_view_model.dart';
import 'package:ecommerce/viewModel/profile_view_model.dart';
import 'package:get/get.dart';
import 'package:ecommerce/viewModel/home_view_model.dart';
import 'package:ecommerce/viewModel/cart_view_model.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => ControlViewModel());
    Get.lazyPut(() => HomeViewModel());
    // Get.lazyPut(() => CartViewModel());
    Get.lazyPut(() => LocalStorageData());
    Get.lazyPut(() => ProfileViewModel());
    Get.lazyPut(() => CheckoutViewModel());
  }
}

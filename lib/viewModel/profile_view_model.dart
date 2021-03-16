import 'package:ecommerce/model/user_model.dart';
import 'package:ecommerce/viewModel/control_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ecommerce/helper/local_storage_data.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class ProfileViewModel extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getCurrentUser();
  }

  final LocalStorageData localStorageData = Get.find();
  ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;

  UserModel get userModel => _userModel;
  UserModel _userModel;

  Future<void> signOut() async {
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
    await FacebookLogin().logOut();
    localStorageData.deleteUser();
    Get.find<ControlViewModel>().changeSelectedValue(0);
    update();
  }

  Future<void> getCurrentUser() async {
    _loading.value = true;
    await localStorageData.getUser.then((value) {
      print(value.name);
      _userModel = value;
    });
    _loading.value = false;
    update();
  }
}

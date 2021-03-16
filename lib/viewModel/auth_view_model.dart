import 'package:ecommerce/helper/local_storage_data.dart';
import 'package:ecommerce/services/firestore_user.dart';
import 'package:ecommerce/view/control_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:ecommerce/model/user_model.dart';

class AuthViewModel extends GetxController {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  FacebookLogin _facebookLogin = FacebookLogin();
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseAuth get auth => _auth;
  String email, password, name;
  Rx<User> _user = Rx<User>();
  String get user => _user.value?.email;
  int categoryIndex = 0;
  final LocalStorageData localStorageData = Get.find();

  @override
  void onInit() {
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
    if (_auth.currentUser != null) {
      getCurrentUserData(_auth.currentUser.uid);
    }
  }

  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount =
        await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);
    await _auth.signInWithCredential(credential).then((user) async {
      await saveUser(user);
    });
    update();
    Get.offAll(ControlView());
  }

  Future<void> signInWithFacebook() async {
    FacebookLoginResult result = await _facebookLogin.logIn(['email']);
    final accessToken = result.accessToken.token;
    if (result.status == FacebookLoginStatus.loggedIn) {
      final credential = FacebookAuthProvider.credential(accessToken);
      await _auth.signInWithCredential(credential).then((user) async {
        await saveUser(user);
      });
      update();
      Get.offAll(ControlView());
    }
  }

  Future<void> signInWithEmailAndPassword() async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        await getCurrentUserData(value.user.uid);
      });
      update();
      Get.offAll(ControlView());
    } catch (e) {
      print(e);
      Get.snackbar('Error Login Account', 'Invalid Username Or Password',
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> signUpWithEmailAndPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) async {
        await saveUser(user);
      });
      update();
      Get.offAll(ControlView());
    } catch (e) {
      print(e);
      Get.snackbar('Error Account Created', 'Invalid Username Or Password',
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> saveUser(UserCredential user) async {
    UserModel userModel = UserModel(
        userId: user.user.uid,
        email: user.user.email,
        name: name == null ? user.user.displayName : name,
        pic: user.user.photoURL);
    await FireStoreUser().addUserToFirestore(userModel);
    await saveUserToSharedPref(userModel);
    update();
  }

  Future<void> saveUserToSharedPref(UserModel userModel) async {
    await localStorageData.setUser(userModel);
  }

  void changeIndex(int index) {
    categoryIndex = index;
    update();
    notifyChildrens();
  }

  getCurrentUserData(String uid) async {
    await FireStoreUser().getCurrentUser(uid).then((value) async {
      await saveUserToSharedPref(UserModel.fromJson(value.data()));
    });
    update();
  }
}

import 'package:ecommerce/helper/binding.dart';
import 'package:ecommerce/viewModel/cart_view_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'view/control_view.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(CartViewModel());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: Binding(),
      home: Scaffold(body: ControlView()),
      theme: ThemeData(
        primaryColor: Color.fromRGBO(0, 197, 105, 1),
        fontFamily: 'Fraunces',
      ),
    );
  }
}

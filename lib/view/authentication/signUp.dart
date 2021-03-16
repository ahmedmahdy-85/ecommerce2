import 'package:ecommerce/viewModel/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/view/authentication/login.dart';
import 'package:ecommerce/widgets/custom_text.dart';
import 'package:ecommerce/widgets/custom_button.dart';
import 'package:ecommerce/widgets/custom_text-Field.dart';

class SignUp extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
            onTap: () {
              Get.offAll(LoginScreen());
            },
            child: Icon(
              Icons.arrow_back_ios,
            )),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 70.0, left: 15.0, right: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(
                      right: 15.0, left: 15.0, top: 15.0, bottom: 20.0),
                  color: Colors.white,
                  child: Form(
                    key: _globalKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: 'Sign Up',
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0,
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        CustomText(
                          text: 'Name',
                          color: Colors.grey.shade600,
                          fontSize: 12.0,
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        CustomTextField(
                          hint: 'Ahmed Mahdy',
                          obsecure: false,
                          keyboard: TextInputType.name,
                          onSaved: (value) {
                            controller.name = value;
                          },
                          validator: (value) {
                            if (controller.name != null) {
                              print(controller.name);
                            }
                          },
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        CustomText(
                          text: 'Email',
                          color: Colors.grey.shade600,
                          fontSize: 12,
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        CustomTextField(
                          hint: 'ahmed-mahdy@live.com',
                          obsecure: false,
                          keyboard: TextInputType.emailAddress,
                          onSaved: (value) {
                            controller.email = value;
                          },
                          validator: (value) {
                            if (controller.email != null) {
                              print(controller.email);
                            }
                          },
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        CustomText(
                          text: 'Password',
                          fontSize: 12.0,
                          color: Colors.grey.shade600,
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        CustomTextField(
                          hint: '**********',
                          obsecure: true,
                          keyboard: TextInputType.visiblePassword,
                          onSaved: (value) {
                            controller.password = value;
                          },
                          validator: (value) {
                            if (controller.password != null) {
                              print(controller.password);
                            }
                          },
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                        CustomButton(
                          onPressed: () {
                            if (_globalKey.currentState.validate()) {
                              _globalKey.currentState.save();
                              controller.signUpWithEmailAndPassword();
                            }
                          },
                          width: MediaQuery.of(context).size.width - 70,
                          text: 'SIGN UP',
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

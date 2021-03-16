import 'package:ecommerce/viewModel/auth_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///D:/Users/amahdy/Desktop/ecommerce/lib/view/authentication/signUp.dart';
import 'package:flutter/rendering.dart';
import 'package:ecommerce/widgets/custom_text-Field.dart';
import 'package:ecommerce/widgets/custom_text.dart';
import 'package:ecommerce/widgets/custom_button.dart';
import 'package:ecommerce/widgets/custom_social_media.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> _globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthViewModel>(
      init: Get.find(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
                top: 50.0, right: 20.0, left: 20.0, bottom: 10.0),
            child: Form(
              key: _globalKey,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      right: 10.0,
                      left: 10.0,
                      top: 8.0,
                      bottom: 20.0,
                    ),
                    color: Colors.white,
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: 'Welcome,',
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                            GestureDetector(
                                onTap: () {
                                  Get.to(SignUp());
                                },
                                child: CustomText(
                                  text: 'Sign Up',
                                  color: Colors.green,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        CustomText(
                          text: 'Sign in to Continue',
                          fontSize: 15.0,
                          color: Colors.grey.shade600,
                          alignment: Alignment.topLeft,
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        CustomText(
                          text: 'Email',
                          fontSize: 10.0,
                          color: Colors.grey.shade600,
                          alignment: Alignment.topLeft,
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        CustomTextField(
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
                          hint: 'Enter Your Email',
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        CustomText(
                          text: 'Password',
                          fontSize: 10.0,
                          color: Colors.grey.shade600,
                          alignment: Alignment.topLeft,
                        ),
                        CustomTextField(
                          keyboard: TextInputType.visiblePassword,
                          obsecure: true,
                          onSaved: (value) {
                            controller.password = value;
                          },
                          validator: (value) {
                            if (controller.password != null) {
                              print(controller.password);
                            }
                          },
                          hint: 'Enter Your Password',
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 15.0, bottom: 15.0, left: 3.0),
                          child: GestureDetector(
                            onTap: null,
                            child: CustomText(
                              text: 'Forget Password?',
                              fontSize: 12.0,
                              alignment: Alignment.topRight,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        CustomButton(
                            text: 'SIGN IN',
                            width: MediaQuery.of(context).size.width - 60,
                            onPressed: () {
                              if (_globalKey.currentState.validate()) {
                                _globalKey.currentState.save();
                                controller.signInWithEmailAndPassword();
                              }
                            }),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0, bottom: 20.0),
                    child: CustomText(
                      text: '-OR-',
                      fontSize: 18.0,
                      color: Colors.black,
                      alignment: Alignment.center,
                    ),
                  ),
                  CustomSocialMedia(
                    text: 'Sign In with Facebook',
                    imageName: 'assets/images/facebook.png',
                    onPressed: () {
                      controller.signInWithFacebook();
                    },
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  CustomSocialMedia(
                    text: 'Sign In with Google',
                    imageName: 'assets/images/google.png',
                    onPressed: () {
                      controller.signInWithGoogle();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

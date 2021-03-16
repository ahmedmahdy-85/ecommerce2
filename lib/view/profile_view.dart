import 'package:ecommerce/view/authentication/login.dart';
import 'package:ecommerce/widgets/custom_text.dart';
import 'package:ecommerce/viewModel/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/widgets/profile_tile.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ProfileViewModel>(
          init: ProfileViewModel(),
          builder: (controller) => controller.loading.value
              ? Center(child: CircularProgressIndicator())
              : GetBuilder<ProfileViewModel>(
                  init: Get.find(),
                  builder: (controller) => Container(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                              top: 60.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: 100.0,
                                  width: 100.0,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: controller.userModel == null
                                            ? AssetImage(
                                                'assets/images/Avatar.png')
                                            : controller.userModel.pic ==
                                                    'default'
                                                ? AssetImage(
                                                    'assets/images/Avatar.png')
                                                : NetworkImage(
                                                    controller.userModel.pic),
                                        fit: BoxFit.fill),
                                    color: Colors.red,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(100.0)),
                                  ),
                                ),
                                Column(
                                  children: [
                                    CustomText(
                                      text: controller.userModel.name,
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.w900,
                                    ),
                                    CustomText(
                                      text: controller.userModel.email,
                                      color: Colors.black,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 70.0,
                          ),
                          ProfileTile(
                            title: 'Edit Profile',
                            leading: 'assets/images/edit.png',
                          ),
                          ProfileTile(
                            title: 'Shipping Address',
                            leading: 'assets/images/location.png',
                          ),
                          ProfileTile(
                            title: 'Order History',
                            leading: 'assets/images/history.png',
                          ),
                          ProfileTile(
                            title: 'Cards',
                            leading: 'assets/images/payment.png',
                          ),
                          ProfileTile(
                            title: 'Notifications',
                            leading: 'assets/images/notification.png',
                          ),
                          ProfileTile(
                            title: 'Log Out',
                            leading: 'assets/images/exit.png',
                            onPressed: () {
                              controller.signOut();
                              Get.offAll(LoginScreen());
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
    );
  }
}

import 'package:ecommerce/view/authentication/login.dart';
import 'package:ecommerce/view/product_details.dart';
import 'package:ecommerce/viewModel/home_view_model.dart';
import 'package:ecommerce/viewModel/profile_view_model.dart';
import 'package:ecommerce/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:ecommerce/widgets/category_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: Get.find(),
      builder: (controller) => controller.loading.value
          ? Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.green,
              ),
            )
          : GetBuilder<HomeViewModel>(
              init: Get.find(),
              builder: (controller) => Scaffold(
                body: Container(
                  padding: EdgeInsets.only(top: 55.0, right: 20.0, left: 20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(20.0)),
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(LineAwesomeIcons.search)),
                            onSaved: (value) {
                              //put code here
                            },
                            validator: (value) {
                              return null;
                            },
                            showCursor: true,
                            autofocus: false,
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        CustomText(
                          alignment: Alignment.topLeft,
                          text: 'Categories',
                          color: Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        //build categories
                        _buildCategory(),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: 'Best Selling',
                              fontSize: 15.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            GestureDetector(
                              onTap: () {
                                // put functionality here
                              },
                              child: CustomText(
                                text: 'See all',
                                fontSize: 12.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        _buildBestSelling(),
                        SizedBox(
                          height: 30.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  Widget _buildCategory() {
    return GetBuilder<HomeViewModel>(
      init: Get.find(),
      builder: (controller) => Container(
        height: 90.0,
        child: ListView.separated(
            separatorBuilder: (context, index) => SizedBox(
                  width: 11.0,
                ),
            controller: ScrollController(keepScrollOffset: true),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: controller.categories.length,
            itemBuilder: (context, index) {
              return CategoryWidget(
                text: controller.categories[index].name,
                image: controller.categories[index].image,
              );
            }),
      ),
    );
  }

  Widget _buildBestSelling() {
    return GetBuilder<HomeViewModel>(
      init: Get.find(),
      builder: (controller) => Container(
        height: 270.0,
        child: ListView.separated(
          controller: ScrollController(keepScrollOffset: true),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: controller.bestSelling.length,
          separatorBuilder: (context, index) => SizedBox(
            width: 20.0,
          ),
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(ProductDetails(
                        productModel: controller.bestSelling[index]));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(8.0)),
                    height: 210.0,
                    width: 150.0,
                    child: Image.network(
                      controller.bestSelling[index].image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                CustomText(
                  text: controller.bestSelling[index].name,
                  fontWeight: FontWeight.bold,
                ),
                CustomText(
                  text: controller.bestSelling[index].brand,
                  color: Colors.grey.shade400,
                  fontSize: 10.0,
                ),
                SizedBox(
                  height: 2.0,
                ),
                CustomText(
                  text: '\$${controller.bestSelling[index].price}',
                  color: Colors.green,
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

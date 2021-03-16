import 'package:ecommerce/viewModel/cart_view_model.dart';
import 'package:ecommerce/widgets/custom_button.dart';
import 'package:ecommerce/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/view/check_out/check_out_view.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
      init: CartViewModel(),
      builder: (controller) => Scaffold(
        body: controller.loading.value
            ? Center(child: CircularProgressIndicator())
            : controller.cartProducts.length == 0
                ? Column(
                    children: [
                      Container(
                        height: 470.0,
                        child: Image.asset(
                          ('assets/images/cart-empty.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                      CustomText(
                        text: 'Cart  Empty',
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 30.0,
                      ),
                    ],
                  )
                : Column(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(top: 15.0, left: 15.0),
                          child: ListView.separated(
                            separatorBuilder:
                                (BuildContext context, int index) => SizedBox(
                              height: 15.0,
                            ),
                            itemBuilder: (context, index) {
                              return Container(
                                height: 140.0,
                                child: Row(
                                  children: [
                                    Container(
                                      child: Image.network(
                                        controller.cartProducts[index].image,
                                        fit: BoxFit.cover,
                                        width: 110.0,
                                        height: 140.0,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 30.0,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          text: controller
                                              .cartProducts[index].name,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0,
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        CustomText(
                                          text:
                                              '\$${controller.cartProducts[index].price}',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17.0,
                                          color: Colors.green,
                                        ),
                                        SizedBox(
                                          height: 25.0,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            color: Colors.grey.shade200,
                                          ),
                                          width: 120.0,
                                          height: 40.0,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5.0, right: 5.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                GestureDetector(
                                                  child: Icon(
                                                    Icons.add,
                                                  ),
                                                  onTap: () {
                                                    controller.increaseQuantity(
                                                        index);
                                                  },
                                                ),
                                                CustomText(
                                                  text: controller
                                                      .cartProducts[index]
                                                      .quantity
                                                      .toString(),
                                                ),
                                                GestureDetector(
                                                  child: Icon(Icons.remove),
                                                  onTap: () {
                                                    controller.decreaseQuantity(
                                                        index);
                                                  },
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                            itemCount: controller.cartProducts.length,
                            scrollDirection: Axis.vertical,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            right: 25.0, left: 25.0, bottom: 10.0, top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                CustomText(
                                  text: 'TOTAL',
                                  fontSize: 15.0,
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                GetBuilder<CartViewModel>(
                                  init: Get.find(),
                                  builder: (controller) => CustomText(
                                    text: '\$ ${controller.totalPayment}',
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                )
                              ],
                            ),
                            CustomButton(
                              text: 'CHECKOUT',
                              width: 120.0,
                              onPressed: () {
                                Get.to(CheckOutView());
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
      ),
    );
  }
}

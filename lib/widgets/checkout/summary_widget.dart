import 'package:ecommerce/viewModel/cart_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../custom_text.dart';

class Summary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetBuilder<CartViewModel>(
        init: Get.find(),
        builder: (controller) => Column(
          children: [
            Container(
              padding: EdgeInsets.all(20.0),
              height: 350.0,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => SizedBox(
                  width: 15.0,
                ),
                itemCount: controller.cartProducts.length,
                itemBuilder: (context, index) => Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 150.0,
                        height: 180.0,
                        child: Image.network(
                          controller.cartProducts[index].image,
                          fit: BoxFit.cover,
                        ),
                      ),
                      RichText(
                        maxLines: 1,
                        text: (TextSpan(
                            text: controller.cartProducts[index].name,
                            style: TextStyle(color: Colors.black))),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      CustomText(
                        text: '\$${controller.cartProducts[index].price}',
                        color: Colors.green,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

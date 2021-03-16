import 'package:ecommerce/model/product_model.dart';
import 'package:ecommerce/view/cart_view.dart';
import 'package:ecommerce/view/control_view.dart';
import 'package:ecommerce/viewModel/cart_view_model.dart';
import 'package:ecommerce/viewModel/control_view_model.dart';
import 'package:ecommerce/widgets/custom_button.dart';
import 'package:ecommerce/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/widgets/product_details_container.dart';
import 'package:get/get.dart';
import 'package:ecommerce/model/cart_model.dart';

class ProductDetails extends StatelessWidget {
  final ProductModel productModel;
  ProductDetails({@required this.productModel});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(children: [
          Container(
            padding: EdgeInsets.only(top: 20.0),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.3,
            child: Image.network(
              productModel.image,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(18.0),
                child: Column(children: [
                  CustomText(
                    text: productModel.name,
                    fontWeight: FontWeight.bold,
                    fontSize: 26.0,
                    alignment: Alignment.topLeft,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      ProductDetailsContainer(
                        text1: 'Size',
                        text2: productModel.size,
                        text: true,
                      ),
                      SizedBox(width: 20.0),
                      ProductDetailsContainer(
                        text1: 'Colour',
                        text: false,
                        color: productModel.color,
                      ),
                      SizedBox(
                        height: 60.0,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  CustomText(
                    text: 'Details',
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    alignment: Alignment.topLeft,
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  CustomText(
                    text: productModel.details,
                    height: 1.5,
                    fontSize: 14.0,
                  ),
                  SizedBox(
                    height: 70.0,
                  ),
                ]),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    CustomText(
                      text: 'PRICE',
                      fontSize: 12.0,
                    ),
                    CustomText(
                      text: '\$${productModel.price}',
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.green,
                    )
                  ],
                ),
                GetBuilder<CartViewModel>(
                  init: Get.find(),
                  builder: (controller) => CustomButton(
                    text: 'ADD',
                    width: 150.0,
                    onPressed: () {
                      controller.addToCart(CartModel(
                          name: productModel.name,
                          image: productModel.image,
                          price: productModel.price,
                          id: productModel.productId,
                          quantity: 1));
                    },
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

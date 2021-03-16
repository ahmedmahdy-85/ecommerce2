import 'package:ecommerce/viewModel/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/widgets/custom_text.dart';
import 'package:get/get.dart';

class CategoryWidget extends GetWidget<HomeViewModel> {
  final String text;
  final String image;
  CategoryWidget({this.text, this.image});
  @override
  Widget build(BuildContext context) {
    return categoryBuild(text, image);
  }

  Widget categoryBuild(String category, String image) {
    return GestureDetector(
      onTap: () {
        print(category);
      },
      child: Column(
        children: [
          CircleAvatar(
            radius: 27.0,
            backgroundColor: Colors.grey.shade200,
            child: Image.network(image),
          ),
          SizedBox(
            height: 5.0,
          ),
          CustomText(
            text: text,
            fontSize: 10.0,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}

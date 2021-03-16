import 'package:flutter/material.dart';
import 'package:ecommerce/widgets/custom_text.dart';

class ProductDetailsContainer extends StatelessWidget {
  final String text1;
  final String text2;
  final bool text;
  final Color color;
  const ProductDetailsContainer(
      {@required this.text1, this.text2, this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      height: 40.0,
      width: MediaQuery.of(context).size.width * 0.42,
      decoration: BoxDecoration(
          // color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(color: Colors.grey.shade200)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: text1,
            fontSize: 15.0,
          ),
          // SizedBox(
          //   width: 70.0,
          // ),
          text
              ? CustomText(
                  text: text2,
                  fontWeight: FontWeight.bold,
                )
              : Container(
                  width: 30.0,
                  height: 20.0,
                  decoration: BoxDecoration(
                    color: color,
                    border: Border.all(color: Colors.grey.shade200),
                    borderRadius: BorderRadius.circular(60.0),
                  ),
                ),
        ],
      ),
    );
  }
}

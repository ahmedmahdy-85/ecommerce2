import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final Alignment alignment;
  final double height;

  CustomText(
      {this.text,
      this.color,
      this.fontSize,
      this.fontWeight,
      this.alignment,
      this.height});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(text,
          style: TextStyle(
            color: color,
            fontWeight: fontWeight,
            fontSize: fontSize,
            height: height,
          )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ecommerce/widgets/custom_text.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final Function onPressed;
  final String text;

  CustomButton({this.width, this.onPressed, this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 50.0,
      child: FlatButton(
        padding: EdgeInsets.all(10.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        color: Theme.of(context).primaryColor,
        onPressed: onPressed,
        child: CustomText(
          text: text,
          color: Colors.white,
          fontSize: 15.0,
        ),
      ),
    );
  }
}

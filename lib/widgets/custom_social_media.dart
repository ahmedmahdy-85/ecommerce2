import 'package:flutter/material.dart';
import 'package:ecommerce/widgets/custom_text.dart';

class CustomSocialMedia extends StatelessWidget {
  final Function onPressed;
  final String text;
  final String imageName;
  CustomSocialMedia({this.onPressed, this.text, this.imageName});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      width: MediaQuery.of(context).size.width - 50,
      child: FlatButton(
        color: Colors.grey.shade100,
        onPressed: onPressed,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        padding: EdgeInsets.all(15.0),
        child: Row(
          children: [
            Image.asset(imageName),
            SizedBox(
              width: 50.0,
            ),
            CustomText(
              text: text,
              color: Colors.black,
              fontSize: 15.0,
            )
          ],
        ),
      ),
    );
  }
}

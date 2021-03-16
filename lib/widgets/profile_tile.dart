import 'package:flutter/material.dart';
import 'package:ecommerce/widgets/custom_text.dart';

class ProfileTile extends StatelessWidget {
  final String title;
  final String leading;
  final Function onPressed;
  ProfileTile({this.title, this.leading, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        onPressed: onPressed,
        child: ListTile(
          title: CustomText(
            fontWeight: FontWeight.w600,
            text: title,
            fontSize: 16.0,
            color: Colors.black,
          ),
          leading: Image.asset(
            leading,
          ),
          trailing: Icon(
            Icons.navigate_next,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

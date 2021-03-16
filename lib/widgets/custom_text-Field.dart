import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextInputType keyboard;
  final TextEditingController controller;
  final Function onSaved;
  final Function validator;
  final String hint;
  final bool obsecure;
  CustomTextField(
      {this.keyboard,
      this.controller,
      this.hint,
      this.onSaved,
      this.validator,
      this.obsecure});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      keyboardType: TextInputType.emailAddress,
      onSaved: onSaved,
      decoration: InputDecoration(
        fillColor: Theme.of(context).primaryColor,
        hintText: hint,
        hintStyle: TextStyle(fontSize: 15.0, color: Colors.grey.shade500),
      ),
      obscureText: obsecure,
    );
  }
}

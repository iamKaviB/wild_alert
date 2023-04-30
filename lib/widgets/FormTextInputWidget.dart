import 'package:flutter/material.dart';

class FormTextInputWidget extends StatelessWidget {
  final String hint;
  final TextEditingController textEditingController;
  final bool isPassword;
  final double height;
  final bool enabled;
  FormTextInputWidget({ Key? key, required this.hint, required this.textEditingController , this.isPassword = false  , this.height = 40 , this.enabled = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
          color: Colors.grey.shade200, borderRadius: BorderRadius.circular(8)),
      child: TextField(
        enabled: enabled,
        obscureText: isPassword,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hint,
            contentPadding: EdgeInsets.only(left: 10, bottom: 5),
            hintStyle: TextStyle(color: Colors.grey, fontSize: 17)),
        controller: textEditingController,
      ),
    );
  }
}
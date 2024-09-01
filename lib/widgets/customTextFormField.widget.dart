import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final int minLines;
  final int maxLines;
  final String hintText;
  final IconButton? suffixIcon;
  const CustomTextFormField(
      {super.key,
      required this.minLines,
      required this.maxLines,
      required this.hintText,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: minLines,
      maxLines: maxLines,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}

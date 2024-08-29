import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final int minLines;
  final int maxLines;
  final String hintText;
  const CustomTextFormField(
      {super.key,
      required this.minLines,
      required this.maxLines,
      required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: minLines,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }
}

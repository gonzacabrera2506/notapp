import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: 5,
      maxLines: null,
      decoration: InputDecoration(
        hintText: 'Escribe aquí...',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }
}

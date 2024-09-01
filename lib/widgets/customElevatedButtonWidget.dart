import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final Function()? action;
  const CustomElevatedButton({super.key, this.action, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.tealAccent,
          foregroundColor: Colors.black,
          elevation: 5,
        ),
        onPressed: action ?? () {},
        child: Text(
          text,
        ));
  }
}

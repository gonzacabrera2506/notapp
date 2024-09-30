import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String? text;
  final Function()? action;
  final Widget child;

  const CustomElevatedButton({
    super.key,
    this.action,
    this.text,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: action ?? () {},
      child: child,
    );
  }
}

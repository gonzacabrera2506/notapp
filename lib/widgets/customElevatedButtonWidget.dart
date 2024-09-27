import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomElevatedButton extends StatelessWidget {
  final String? text;
  final Function()? action;

  const CustomElevatedButton({
    super.key,
    this.action,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: action ?? () {},
      child: const FaIcon(
        FontAwesomeIcons.solidFloppyDisk,
        size: 14,
      ),
    );
  }
}

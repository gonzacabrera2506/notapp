import 'package:flutter/material.dart';

class CustomSwitchButton extends StatefulWidget {
  final void Function(bool) action;
  const CustomSwitchButton({super.key, required this.action});

  @override
  State<CustomSwitchButton> createState() => _CustomSwitchButtonState();
}

class _CustomSwitchButtonState extends State<CustomSwitchButton> {
  bool light = false;
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: light,
      activeColor: Colors.tealAccent,
      activeTrackColor: Colors.white,
      inactiveThumbColor: Colors.white,
      inactiveTrackColor: Colors.black,
      onChanged: (bool value) {
        setState(() {
          light = value;
        });
        widget.action(value);
      },
    );
  }
}

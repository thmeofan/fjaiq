import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IOSStyleToggle extends StatefulWidget {
  final ValueChanged<bool> onChanged;
  final bool value;

  IOSStyleToggle({
    required this.value,
    required this.onChanged,
  });

  @override
  _IOSStyleToggleState createState() => _IOSStyleToggleState();
}

class _IOSStyleToggleState extends State<IOSStyleToggle> {
  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      value: widget.value,
      onChanged: widget.onChanged,
    );
  }
}

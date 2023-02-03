import 'package:flutter/material.dart';

import 'labeled_checkbox.dart';

class RknCheckbox extends StatefulWidget {
  
  final Position labelPosition;
  final String? label;
  final ValueChanged<bool> onChanged;

  
  const RknCheckbox({super.key, required this.onChanged, this.labelPosition = Position.right, this.label});

  @override
  // ignore: library_private_types_in_public_api
  _RknCheckboxState createState() => _RknCheckboxState();
}

class _RknCheckboxState extends State<RknCheckbox> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return LabeledCheckbox(
      labelPosition: widget.labelPosition,
      label: widget.label,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      value: _isChecked,
      onChanged: (value) {
        setState(() {
          _isChecked = value ?? false;
        });
        widget.onChanged(value ?? false);
      },
    );
  }
}

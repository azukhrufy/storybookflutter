// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class RukunCheckbox extends StatefulWidget {
  final String? title;
  final ValueChanged<bool> onChanged;
  final String? labelPosition;

  const RukunCheckbox(
      {super.key, required this.onChanged, this.title, this.labelPosition});

  @override
  // ignore: library_private_types_in_public_api
  _RukunCheckboxState createState() => _RukunCheckboxState();
}

class _RukunCheckboxState extends State<RukunCheckbox> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(widget.title ?? ''),
      activeColor: const Color(0xFF2BE2BF),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2.0),
      ),
      side: MaterialStateBorderSide.resolveWith(
        (states) => const BorderSide(width: 1.0, color: Color(0xFFD9D9D9)),
      ),
      value: _isChecked,
      onChanged: (value) {
        setState(() {
          _isChecked = value ?? false;
        });
        widget.onChanged(value ?? false);
      },
      controlAffinity:
          widget.labelPosition == 'right' || widget.labelPosition == null
              ? ListTileControlAffinity.leading
              : ListTileControlAffinity.trailing,
    );
  }
}

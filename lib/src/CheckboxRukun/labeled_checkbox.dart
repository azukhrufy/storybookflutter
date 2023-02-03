import 'package:flutter/material.dart';

enum Position{
    left, 
    right,
  }

class LabeledCheckbox extends StatelessWidget {
  const LabeledCheckbox({
    super.key,
    this.label,
    required this.padding,
    required this.value,
    required this.onChanged,
    this.labelPosition = Position.right,
  });

  final String? label;
  final EdgeInsets padding;
  final bool value;
  final ValueChanged<bool> onChanged;
  final Position labelPosition;
  

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          onChanged(!value);
        },
        child: Padding(
          padding: padding,
          child: Row(
            children: labelPosition == Position.left
                ? <Widget>[
                    Text(label ?? '', style: const TextStyle(fontSize: 14, fontFamily: 'Inter')),
                    label != null ? const SizedBox(width: 16) : const SizedBox(width: 0),
                    Checkbox(
                      activeColor: const Color(0xFF2BE2BF),
                      side: MaterialStateBorderSide.resolveWith(
                        (states) => const BorderSide(
                            width: 1.0, color: Color(0xFFD9D9D9)),
                      ),
                      value: value,
                      onChanged: (bool? newValue) {
                        onChanged(newValue!);
                      },
                    ),
                  ]
                : <Widget>[
                    Checkbox(
                      activeColor: const Color(0xFF2BE2BF),
                      side: MaterialStateBorderSide.resolveWith(
                        (states) => const BorderSide(
                            width: 1.0, color: Color(0xFFD9D9D9)),
                      ),
                      value: value,
                      onChanged: (bool? newValue) {
                        onChanged(newValue!);
                      },
                    ),
                    label != null ? const SizedBox(width: 16) : const SizedBox(width: 0),
                    Text(label ?? '', style: const TextStyle(fontSize: 14, fontFamily: 'Inter'))
                  ],
          ),
        ));
  }
}

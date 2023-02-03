import 'package:flutter/material.dart';
import 'package:rukun_ui/src/CheckboxRukun/checkbox_rukun.dart';
import 'package:rukun_ui/src/CheckboxRukun/checkbox_rukun.dart';
import 'package:rukun_ui/src/CheckboxRukun/labeled_checkbox.dart';

class RknCheckboxStories extends StatelessWidget {
  const RknCheckboxStories({super.key});

  static const routeName = '/Checkbox-Rukun';

  void _checkboxChanged(bool value) {
    print('Checkbox is $value');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor : Colors.white,
        appBar: AppBar(
          title: const Text('Checkbox Rukun'),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: <Widget>[
            RknCheckbox(
                labelPosition: Position.left,
                label: 'Left Label',
                onChanged: _checkboxChanged),
            RknCheckbox(
                labelPosition: Position.right,
                label: 'Right label',
                onChanged: _checkboxChanged),
            RknCheckbox(
                label: 'Label with default label position',
                onChanged: _checkboxChanged),
            RknCheckbox(onChanged: _checkboxChanged),
          ],
        ));
  }
}

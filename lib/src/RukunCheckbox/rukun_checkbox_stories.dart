import 'package:flutter/material.dart';
import 'package:rukun_ui/src/RukunCheckbox/rukun_checkbox.dart';

class RukunCheckboxStories extends StatelessWidget {
  void _checkboxChanged(bool value) {
    print('Checkbox is $value');
  }

  const RukunCheckboxStories({super.key});

  static const routeName = '/Rukun-Checkbox';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Rukun Checkbox'),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: <Widget>[
            RukunCheckbox(onChanged: _checkboxChanged, title: 'Right Label', labelPosition: 'right'),
            RukunCheckbox(onChanged: _checkboxChanged, title: ''),
            RukunCheckbox(onChanged: _checkboxChanged, title: 'Left Label', labelPosition: 'left'),
          ],
        ));
  }
}

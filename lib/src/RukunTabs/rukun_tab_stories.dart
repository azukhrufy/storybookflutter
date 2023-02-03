import 'package:flutter/material.dart';
import 'package:rukun_ui/src/RukunTabs/rukun_tab.dart';

class RknTabStories extends StatelessWidget {
  const RknTabStories({super.key});

  static const routeName = '/Rukun-Tab';

  static const _tabs = [
    Tab(text: 'Tab1'),
    Tab(text: 'Tab2'),
    Tab(text: 'Tab3'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Rukun Tab'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          Text('Rukun Tabs Rounded'),
          RknTab(
            rounded: true,
            tabs: _tabs,
          ),
          Divider(
            color: Colors.transparent,
          ),
          Text('Rukun Tabs default'),
          RknTab(
            tabs: _tabs,
          ),
        ]
            .map((item) => Column(
                  /// Added a divider after each item to let the tabbars have room to breathe
                  children: [
                    item,
                    Divider(
                      color: Colors.transparent,
                    )
                  ],
                ))
            .toList(),
      ),
    );
  }
}

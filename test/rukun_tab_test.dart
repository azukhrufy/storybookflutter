import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rukun_ui/src/RukunTabs/rukun_tab.dart';

void main() {
  group('RknTab Widget', () {
    // testWidgets('should initialize the tab controller', (tester) async {
    //   final tabs = [Tab(text: 'Tab 1'), Tab(text: 'Tab 2')];
    //   final widget = RknTab(tabs: tabs);

    //   await tester.pumpWidget(MaterialApp(home: widget));
    //   final state = tester.state(find.byType(RknTab));

    //   expect(state.widget.tabController, isNotNull);
    //   expect(state.widget.tabController.length, 2);
    // });

    testWidgets('should build a tab bar with rounded indicator',
        (WidgetTester tester) async {
      final tabs = [Tab(text: 'Tab 1'), Tab(text: 'Tab 2')];
      final widget = RknTab(tabs: tabs, rounded: true);

      await tester.pumpWidget(
        MaterialApp(
          home: Material(child: widget),
        ),
      );

      final tabBar = tester.widget(find.byType(TabBar)) as TabBar;

      if (tabBar.indicator is BoxDecoration) {
        final boxDecoration = tabBar.indicator as BoxDecoration;
        expect(boxDecoration.borderRadius, BorderRadius.circular(40.0));
      } else {
        throw Exception('Unexpected decoration type');
      }
    });

    // testWidgets('should build a tab bar with straight indicator', (tester) async {
    //   final tabs = [Tab(text: 'Tab 1'), Tab(text: 'Tab 2')];
    //   final widget = RknTab(tabs: tabs, rounded: false);

    //   await tester.pumpWidget(MaterialApp(home: widget));

    //   final tabBar = find.byType(TabBar);
    //   final indicator = tester.widget<DecoratedBox>(find.descendant(
    //     of: tabBar,
    //     matching: find.byType(DecoratedBox),
    //   ));

    //   expect(indicator.decoration.border, isNotNull);
    // });

    // testWidgets('should dispose the tab controller', (tester) async {
    //   final tabs = [Tab(text: 'Tab 1'), Tab(text: 'Tab 2')];
    //   final widget = RknTab(tabs: tabs);

    //   await tester.pumpWidget(MaterialApp(home: widget));
    //   final state = tester.state(find.byType(RknTab));

    //   state.dispose();
    //   expect(state.widget._tabController.disposed, isTrue);
    // });
  });
}

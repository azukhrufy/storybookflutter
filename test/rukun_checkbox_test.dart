import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:rukun_ui/src/RukunCheckbox/rukun_checkbox.dart';

void main() {
  group('RukunCheckbox', () {
    testWidgets('has default title when not provided', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Material(
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Center(child: RukunCheckbox(onChanged: (bool value) {
                print('Checkbox is $value');
              })),
            ),
          ),
        ),
      );
      final titleFinder = find.text('');
      expect(titleFinder, findsOneWidget);
    });

    testWidgets('displays provided title', (WidgetTester tester) async {
      const title = 'Test Title';
      await tester.pumpWidget(
       MaterialApp(
          home: Material(
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Center(child: RukunCheckbox(
                onChanged: (bool value) {
                print('Checkbox is $value');
              },
              title: title,
              )),
            ),
          ),
        ),
      );

      final titleFinder = find.text(title);
      expect(titleFinder, findsOneWidget);
    });

    testWidgets('calls onChanged when checkbox is tapped', (WidgetTester tester) async {
      bool? checkboxValue;
      await tester.pumpWidget(
         MaterialApp(
          home: Material(
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Center(child: RukunCheckbox(onChanged: (bool value) {
                checkboxValue = value;
              })),
            ),
          ),
        ),
      );

      final checkboxFinder = find.byType(CheckboxListTile);
      expect(checkboxFinder, findsOneWidget);
      await tester.tap(checkboxFinder);
      await tester.pumpAndSettle();

      expect(checkboxValue, isTrue);
    });
  });
}

class MultiProvider {}

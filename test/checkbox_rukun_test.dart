import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:rukun_ui/src/CheckboxRukun/checkbox_rukun.dart';
import 'package:rukun_ui/src/CheckboxRukun/labeled_checkbox.dart';

void main() {
  group('CheckboxRukun', () {
    testWidgets('displays label on the left by default', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
            home: Material(
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: RknCheckbox(
              label: 'Test label',
              onChanged: (_) {},
            ),
          ),
        )),
      );
      final textFinder = find.text('Test label');
      expect(textFinder, findsOneWidget);
      expect(tester.getTopLeft(textFinder).dx, lessThan(100));
    });

    testWidgets('displays label on the right when specified', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
            home: Material(
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: RknCheckbox(
              label: 'Test label',
              onChanged: (_) {},
              labelPosition: Position.right,
            ),
          ),
        )),
      );
      final textFinder = find.text('Test label');
      expect(textFinder, findsOneWidget);
      expect(tester.getTopRight(textFinder).dx, greaterThan(100));
    });

    testWidgets('calls onChanged when tapped', (WidgetTester tester) async {
      bool value = false;
      await tester.pumpWidget(
        MaterialApp(
            home: Material(
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: LabeledCheckbox(
              label: 'Test label',
              onChanged: (bool newValue) {
                value = newValue;
              },
              labelPosition: Position.right, padding: EdgeInsets.zero, value: value,
            ),
          ),
        )),
      );
      final checkboxFinder = find.byType(Checkbox);
      expect(checkboxFinder, findsOneWidget);
      await tester.tap(checkboxFinder);
      await tester.pumpAndSettle();

      expect(value, isTrue);
    });
    
  });
}

class MultiProvider {}

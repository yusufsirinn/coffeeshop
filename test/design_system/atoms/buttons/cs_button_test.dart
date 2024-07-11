import 'package:coffeeshop/design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_utils/pump_app.dart';

void main() {
  group('CSButton -', () {
    testWidgets('displays the correct text', (WidgetTester tester) async {
      await tester.pumpApp(
        Scaffold(
          body: CSButton(
            onPressed: () {},
            text: 'Test Button',
          ),
        ),
      );

      expect(find.text('Test Button'), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (WidgetTester tester) async {
      bool wasPressed = false;

      await tester.pumpApp(
        Scaffold(
          body: CSButton(
            onPressed: () {
              wasPressed = true;
            },
            text: 'Press Me',
          ),
        ),
      );

      await tester.tap(find.text('Press Me'));
      await tester.pump();

      expect(wasPressed, isTrue);
    });
  });
}

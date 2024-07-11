import 'package:coffeeshop/design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_utils/pump_app.dart';

void main() {
  group('CSEmptyList -', () {
    testWidgets('shows child when list is not empty', (WidgetTester tester) async {
      await tester.pumpApp(
        const Scaffold(
          body: CSEmptyList(
            list: ['Item 1', 'Item 2'],
            info: 'Empty list message',
            child: Text('List is not empty'),
          ),
        ),
      );

      expect(find.text('List is not empty'), findsOneWidget);
      expect(find.text('Empty list message'), findsNothing);
    });

    testWidgets('shows empty message when list is empty', (WidgetTester tester) async {
      await tester.pumpApp(
        const Scaffold(
          body: CSEmptyList(
            list: [],
            info: 'Empty list message',
            child: Text('List is not empty'),
          ),
        ),
      );

      expect(find.text('List is not empty'), findsNothing);
    });
  });
}

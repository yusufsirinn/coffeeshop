import 'package:coffeeshop/core/core.dart';
import 'package:coffeeshop/design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_utils/pump_app.dart';

void main() {
  group('CSBottomNavigationBarContainer -', () {
    testWidgets('displays child widget', (WidgetTester tester) async {
      const testKey = Key('childWidget');

      await tester.pumpApp(
        const Scaffold(
          bottomNavigationBar: CSBottomNavigationBarContainer(
            child: Text('Test Child', key: testKey),
          ),
        ),
      );

      expect(find.byKey(testKey), findsOneWidget);
      expect(find.text('Test Child'), findsOneWidget);
    });

    testWidgets('applies default height', (WidgetTester tester) async {
      await tester.pumpApp(
        const Scaffold(
          bottomNavigationBar: CSBottomNavigationBarContainer(
            child: Text('Test Child'),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      expect(container.constraints?.maxHeight, equals(60));
    });

    testWidgets('applies custom height', (WidgetTester tester) async {
      const customHeight = 80.0;

      await tester.pumpApp(
        const Scaffold(
          bottomNavigationBar: CSBottomNavigationBarContainer(
            height: customHeight,
            child: Text('Test Child'),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      expect(container.constraints?.maxHeight, equals(customHeight));
    });

    testWidgets('applies correct decoration', (WidgetTester tester) async {
      await tester.pumpApp(
        const Scaffold(
          bottomNavigationBar: CSBottomNavigationBarContainer(
            child: Text('Test Child'),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration as BoxDecoration;

      expect(
          decoration.borderRadius,
          const BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ));
      expect(decoration.border?.top.color, AppColors.seashell);
    });
  });
}

import 'package:coffeeshop/core/core.dart';
import 'package:coffeeshop/design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_utils/pump_app.dart';

void main() {
  group('CSIndicator -', () {
    testWidgets('default color test', (WidgetTester tester) async {
      await tester.pumpApp(
        const CSIndicator(),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      CircularProgressIndicator circularProgressIndicator = tester.widget(find.byType(CircularProgressIndicator));
      expect(circularProgressIndicator.color, equals(AppColors.orangeSalmon));
    });

    testWidgets('custom color test', (WidgetTester tester) async {
      const Color customColor = Colors.blue;
      await tester.pumpApp(
        const CSIndicator(color: customColor),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      CircularProgressIndicator circularProgressIndicator = tester.widget(find.byType(CircularProgressIndicator));
      expect(circularProgressIndicator.color, equals(customColor));
    });
  });
}

import 'package:coffeeshop/design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_utils/pump_app.dart';

void main() {
  group('CSDivider -', () {
    testWidgets('displays with default color and thickness', (WidgetTester tester) async {
      await tester.pumpApp(
        const Scaffold(
          body: CSDivider(),
        ),
      );

      final divider = tester.widget<Divider>(find.byType(Divider));
      expect(divider.color, AppColors.greenWhite);
      expect(divider.thickness, 1);
      expect(divider.height, 0);
    });

    testWidgets('displays with custom color and thickness', (WidgetTester tester) async {
      const customColor = Colors.red;
      const customThickness = 2.0;

      await tester.pumpApp(
        const Scaffold(
          body: CSDivider(
            color: customColor,
            thickness: customThickness,
          ),
        ),
      );

      final divider = tester.widget<Divider>(find.byType(Divider));
      expect(divider.color, customColor);
      expect(divider.thickness, customThickness);
    });
  });
}

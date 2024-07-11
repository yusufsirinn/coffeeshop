import 'package:coffeeshop/core/core.dart';
import 'package:coffeeshop/design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_utils/pump_app.dart';

void main() {
  group('CSChip -', () {
    testWidgets('displays icon and correct text', (WidgetTester tester) async {
      const testIcon = AppIcons.note;
      const testText = 'Test Chip';

      await tester.pumpApp(
        const Scaffold(
          body: CSChip(
            icon: testIcon,
            text: testText,
          ),
        ),
      );

      expect(find.byType(SvgPicture), findsOneWidget);
      expect(find.text(testText), findsOneWidget);
    });

    testWidgets('displays correct styling', (WidgetTester tester) async {
      const testIcon = AppIcons.note;
      const testText = 'Test Chip';

      await tester.pumpApp(
        const Scaffold(
          body: CSChip(
            icon: testIcon,
            text: testText,
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration as BoxDecoration;

      expect(decoration.color, Colors.white);
      expect(decoration.borderRadius, BorderRadius.circular(16));
      expect(decoration.border?.top.color, AppColors.gainsboro);
    });
  });
}

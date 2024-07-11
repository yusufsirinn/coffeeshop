import 'package:coffeeshop/design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_utils/pump_app.dart';

void main() {
  group('CSStepper -', () {
    testWidgets('widget test', (WidgetTester tester) async {
      const int totalSteps = 5;
      const int currentStep = 2;

      await tester.pumpApp(
        const Scaffold(
          body: CSStepper(
            totalStep: totalSteps,
            currentStep: currentStep,
          ),
        ),
      );

      for (int i = 0; i < totalSteps; i++) {
        final Finder stepFinder = find.byWidgetPredicate((widget) =>
            widget is Container &&
            widget.decoration is BoxDecoration &&
            (widget.decoration as BoxDecoration).color != null);

        expect(stepFinder, findsNWidgets(totalSteps));

        final BoxDecoration decoration = (tester.widget(stepFinder.at(i)) as Container).decoration as BoxDecoration;

        if (i < currentStep) {
          expect(decoration.color, equals(AppColors.greenishTeal));
        } else {
          expect(decoration.color, equals(AppColors.lavender));
        }
      }
    });
  });
}

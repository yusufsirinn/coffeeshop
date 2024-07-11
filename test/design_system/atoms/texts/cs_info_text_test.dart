import 'package:coffeeshop/design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_utils/pump_app.dart';

void main() {
  group('CSInfoText -', () {
    testWidgets('should display provided text', (WidgetTester tester) async {
      await tester.pumpApp(const Scaffold(
        body: CSInfoText(text: 'text'),
      ));

      expect(find.text('text'), findsOneWidget);
    });
  });
}

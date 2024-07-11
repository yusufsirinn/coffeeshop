import 'package:coffeeshop/design_system/design_system.dart';
import 'package:coffeeshop/views/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_utils/pump_app.dart';

void main() {
  group('HomePagePromoCard widget test', () {
    testWidgets('HomePagePromoCard renders correctly', (WidgetTester tester) async {
      const String promoText = '50% OFF \nToday Only';

      await tester.pumpApp(
        const Scaffold(
          body: HomePagePromoCard(
            text: promoText,
          ),
        ),
      );

      expect(find.byType(CSTextWithBackgroundPainter), findsOneWidget);
    });
  });
}

import 'package:coffeeshop/views/detail/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_utils/pump_app.dart';

void main() {
  group('Detail - DetailCoffeeStarRating widget test', () {
    testWidgets('DetailCoffeeStarRating renders correctly', (WidgetTester tester) async {
      const String coffeeName = 'Cappuccino';
      final List<String> ingredients = ['Espresso', 'Milk', 'Foam'];

      await tester.pumpApp(
        Scaffold(
          body: DetailCoffeeStarRating(
            name: coffeeName,
            ingredients: ingredients,
          ),
        ),
      );

      expect(find.text(coffeeName), findsOneWidget);

      expect(find.byType(SvgPicture), findsOneWidget);
      expect(find.byType(Image), findsNWidgets(2));
    });
  });
}

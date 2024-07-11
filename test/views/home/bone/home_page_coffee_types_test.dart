import 'package:coffeeshop/core/core.dart';
import 'package:coffeeshop/views/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_utils/pump_app.dart';

void main() {
  group('HomePage - HomePageCoffeeTypes widget test', () {
    testWidgets('HomePageCoffeeTypes renders correctly', (WidgetTester tester) async {
      final List<String> coffeeTypes = ['Espresso', 'Latte', 'Cappuccino'];
      var selectedIndex = 1;

      await tester.pumpApp(
        Scaffold(
          body: HomePageCoffeeTypes(
            selectedIndex: selectedIndex,
            coffees: coffeeTypes,
            onTap: (val) {},
          ),
        ),
      );

      expect(find.byType(Container), findsNWidgets(coffeeTypes.length));

      for (int i = 0; i < coffeeTypes.length; i++) {
        expect(find.text(coffeeTypes[i]), findsOneWidget);

        final textWidgets = find.text(coffeeTypes[i]).evaluate().toList();

        expect(textWidgets.length, 1);

        var text = tester.firstWidget(find.text(coffeeTypes[i])) as Text;
        expect(text.style!.color, (i == selectedIndex ? Colors.white : AppColors.plantation));
        expect(text.style!.fontWeight, (i == selectedIndex ? FontWeight.w600 : FontWeight.w400));
      }
    });
  });
}

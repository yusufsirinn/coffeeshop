import 'package:coffeeshop/views/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_utils/pump_app.dart';

void main() {
  group('HomePage - HomePageSearchCoffee widget test', () {
    testWidgets('HomePageSearchCoffee renders correctly', (WidgetTester tester) async {
      await tester.pumpApp(
        Scaffold(
          body: HomePageSearchCoffee(
            onChanged: (val) {},
          ),
        ),
      );

      expect(find.byType(TextField), findsOneWidget);
      expect(find.text('Search...'), findsNothing);

      expect(find.byType(SvgPicture), findsNWidgets(2));
    });
  });
}

import 'package:coffeeshop/views/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../test_utils/pump_app.dart';

void main() {
  group('HomePage - HomePageBackgroundTile widget test', () {
    testWidgets('HomePageBackgroundTile renders correctly', (WidgetTester tester) async {
      await tester.pumpApp(
        const Scaffold(
          body: HomePageBackgroundTile(),
        ),
      );

      expect(find.byType(Container), findsNWidgets(2));
      expect(find.byType(Expanded), findsOneWidget);
    });
  });
}

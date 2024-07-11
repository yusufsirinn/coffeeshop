import 'package:coffeeshop/views/delivery/delivery_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_utils/pump_app.dart';

void main() {
  group('Delivery - DeliveryOrderTile widget test -', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await tester.pumpApp(
        const Scaffold(
          body: DeliveryOrderTile(),
        ),
      );

      expect(find.byType(Container), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
      expect(find.text('delivery.order.title'), findsOneWidget);
      expect(find.text('delivery.order.subtitle'), findsOneWidget);
    });
  });
}

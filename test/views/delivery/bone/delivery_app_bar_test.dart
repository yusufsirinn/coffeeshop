import 'package:coffeeshop/views/delivery/delivery_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_utils/pump_app.dart';

void main() {
  group('DeliveryAppBar - DeliveryAppBar widget test', () {
    testWidgets('AppBar renders correctly', (WidgetTester tester) async {
      await tester.pumpApp(
        const Scaffold(
          body: DeliveryAppBar(),
        ),
      );

      expect(find.byType(SvgPicture), findsNWidgets(2));
    });
  });
}

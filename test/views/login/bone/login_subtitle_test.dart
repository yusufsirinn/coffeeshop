import 'package:coffeeshop/views/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_utils/pump_app.dart';

void main() {
  group('Login - LoginSubtitle widget test', () {
    testWidgets('LoginSubtitle renders correctly', (WidgetTester tester) async {
      await tester.pumpApp(
        const Scaffold(
          body: LoginSubtitle(),
        ),
      );

      expect(find.text('login.subtitle'), findsOneWidget);
    });
  });
}

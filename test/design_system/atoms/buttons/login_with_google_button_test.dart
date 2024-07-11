import 'package:coffeeshop/design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_utils/pump_app.dart';

void main() {
  group('LoginWithGoogleButton -', () {
    testWidgets('displays Google logo and correct text', (WidgetTester tester) async {
      await tester.pumpApp(
        Scaffold(
          body: LoginWithGoogleButton(
            onTap: () {},
          ),
        ),
      );

      expect(find.byType(SvgPicture), findsOneWidget);
      expect(find.text('login.button'), findsOneWidget);
    });

    testWidgets('calls onTap when tapped', (WidgetTester tester) async {
      bool wasTapped = false;

      await tester.pumpApp(
        Scaffold(
          body: LoginWithGoogleButton(
            onTap: () {
              wasTapped = true;
            },
          ),
        ),
      );

      await tester.tap(find.byType(InkWell));
      await tester.pump();

      expect(wasTapped, isTrue);
    });
  });
}

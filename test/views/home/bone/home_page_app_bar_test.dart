import 'package:coffeeshop/views/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_utils/pump_app.dart';

void main() {
  group('HomePageAppBar widget test', () {
    testWidgets('HomePageAppBar renders correctly', (WidgetTester tester) async {
      await tester.pumpApp(
        const Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: HomePageAppBar(),
          ),
        ),
      );

      expect(find.text('home.appBar.title'), findsOneWidget);
      expect(find.text('home.appBar.subtitle'), findsOneWidget);

      expect(find.byType(Container), findsOneWidget);
      expect(find.byType(SvgPicture), findsOneWidget);
    });
  });
}

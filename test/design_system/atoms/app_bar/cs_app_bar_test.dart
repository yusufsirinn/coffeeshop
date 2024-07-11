import 'package:coffeeshop/design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../test_utils/pump_app.dart';

void main() {
  testWidgets('CSAppBar - displays title and leading icon', (WidgetTester tester) async {
    await tester.pumpApp(
      const Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: CSAppBar(
            title: 'Test Title',
            trailing: Icon(Icons.settings),
          ),
        ),
      ),
    );

    expect(find.text('Test Title'), findsOneWidget);

    expect(find.byType(SvgPicture), findsOneWidget);

    expect(find.byIcon(Icons.settings), findsOneWidget);
  });
}

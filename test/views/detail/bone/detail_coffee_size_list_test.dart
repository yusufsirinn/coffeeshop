import 'package:coffeeshop/design_system/design_system.dart';
import 'package:coffeeshop/views/detail/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_utils/pump_app.dart';

void main() {
  group('Detail - DetailCoffeeSizeList and CoffeeSizeTile widget tests', () {
    testWidgets('DetailCoffeeSizeList renders correctly', (WidgetTester tester) async {
      final List<String> sizeList = ['S', 'M', 'L'];
      const int selectedSizeIndex = 1;

      await tester.pumpApp(
        Scaffold(
          body: DetailCoffeeSizeList(
            coffeeSizeList: sizeList,
            selectedSizeIndex: selectedSizeIndex,
          ),
        ),
      );

      expect(find.byType(CoffeeSizeTile), findsNWidgets(sizeList.length));

      expect(find.widgetWithText(CoffeeSizeTile, sizeList[selectedSizeIndex]), findsOneWidget);
      expect(
          find.byWidgetPredicate((widget) =>
              widget is DecoratedBox &&
              widget.decoration is BoxDecoration &&
              (widget.decoration as BoxDecoration).color == AppColors.veryLightPink),
          findsOneWidget);
    });

    testWidgets('CoffeeSizeTile renders correctly when selected', (WidgetTester tester) async {
      const String sizeText = 'Medium';
      final widget = Scaffold(
        body: CoffeeSizeTile.selected(text: sizeText),
      );

      await tester.pumpApp(widget);

      expect(find.text(sizeText), findsOneWidget);
      expect(
          find.byWidgetPredicate((widget) =>
              widget is DecoratedBox &&
              widget.decoration is BoxDecoration &&
              (widget.decoration as BoxDecoration).color == AppColors.veryLightPink),
          findsOneWidget);
    });

    testWidgets('CoffeeSizeTile renders correctly when unselected', (WidgetTester tester) async {
      const String sizeText = 'Large';
      final widget = Scaffold(
        body: CoffeeSizeTile.unselected(text: sizeText),
      );

      await tester.pumpApp(widget);

      expect(find.text(sizeText), findsOneWidget);
      expect(
          find.byWidgetPredicate((widget) =>
              widget is DecoratedBox &&
              widget.decoration is BoxDecoration &&
              (widget.decoration as BoxDecoration).color == Colors.white),
          findsOneWidget);
    });
  });
}

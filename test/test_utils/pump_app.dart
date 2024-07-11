import 'package:coffeeshop/core/init/app_setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

extension AppWidgetTester on WidgetTester {
  Future<void> pumpApp(Widget child) async {
    AppSetup.init();
    return pumpWidget(
      MaterialApp(home: child),
    );
  }
}

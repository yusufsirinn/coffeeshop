import 'package:coffeeshop/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../test_utils/pump_app.dart';

void main() {
  group('ViewStateWidget', () {
    testWidgets('shows initial widget when status is initial', (WidgetTester tester) async {
      const initialWidget = Text('Initial Widget');
      const widget = ViewStateWidget(status: Status.initial, initial: initialWidget);

      await tester.pumpApp(const MaterialApp(home: Scaffold(body: widget)));

      expect(find.text('Initial Widget'), findsOneWidget);
    });

    testWidgets('shows success widget when status is success', (WidgetTester tester) async {
      const successWidget = Text('Success Widget');
      const widget = ViewStateWidget(status: Status.success, success: successWidget);

      await tester.pumpApp(const Scaffold(body: widget));

      expect(find.text('Success Widget'), findsOneWidget);
    });

    testWidgets('shows failure widget when status is failure', (WidgetTester tester) async {
      const failureWidget = Text('Failure Widget');
      const widget = ViewStateWidget(status: Status.failure, failure: failureWidget);

      await tester.pumpApp(const MaterialApp(home: Scaffold(body: widget)));

      expect(find.text('Failure Widget'), findsOneWidget);
    });

    testWidgets('shows loading widget when status is loading', (WidgetTester tester) async {
      const loadingWidget = Text('Loading Widget');
      const widget = ViewStateWidget(status: Status.loading, loading: loadingWidget);

      await tester.pumpApp(const MaterialApp(home: Scaffold(body: widget)));

      expect(find.text('Loading Widget'), findsOneWidget);
    });

    testWidgets('shows default widget when no specific widget matches status', (WidgetTester tester) async {
      const defaultWidget = Text('Default Widget');
      const widget = ViewStateWidget(status: Status.success, defaultWidget: defaultWidget);

      await tester.pumpApp(const MaterialApp(home: Scaffold(body: widget)));

      expect(find.text('Default Widget'), findsOneWidget);
    });

    testWidgets('shows SizedBox when no default widget is provided', (WidgetTester tester) async {
      const widget = ViewStateWidget(status: Status.success);

      await tester.pumpApp(const MaterialApp(home: Scaffold(body: widget)));

      expect(find.byType(SizedBox), findsOneWidget);
    });
  });
}

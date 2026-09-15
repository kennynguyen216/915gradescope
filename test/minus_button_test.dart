import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:counter_app/main.dart';

// Short real-time pause so each tap is visible when run on a device.
Future<void> pause(WidgetTester tester) =>
    tester.runAsync(() => Future.delayed(const Duration(milliseconds: 800)));

void main() {
  testWidgets('Pressing "-" three times makes the counter -3', (tester) async {
    await tester.pumpWidget(const MyApp());
    await pause(tester);

    // Name is in the UI and counter starts at 0.
    expect(find.text("$appAuthor's Counter App"), findsOneWidget);
    expect(find.byKey(const Key('counterText')), findsOneWidget);
    expect(tester.widget<Text>(find.byKey(const Key('counterText'))).data, '0');

    // Press "-" three times.
    for (var i = 0; i < 3; i++) {
      await tester.tap(find.byTooltip('Decrement'));
      await tester.pump();
      await pause(tester);
    }

    // Verify the app state.
    expect(tester.widget<Text>(find.byKey(const Key('counterText'))).data, '-3');
    expect(find.text('-3'), findsOneWidget);
  });
}

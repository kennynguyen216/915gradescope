import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:counter_app/main.dart';

void main() {
  testWidgets('App shows the author name in the title', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text("$appAuthor's Counter App"), findsOneWidget);
  });

  testWidgets('+, -, and 0 buttons update the counter', (tester) async {
    await tester.pumpWidget(const MyApp());

    // Starts at 0.
    expect(find.text('0'), findsNWidgets(2)); // counter text + reset button label

    // Tap + twice.
    await tester.tap(find.byIcon(Icons.add));
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    expect(find.text('2'), findsOneWidget);

    // Tap - once.
    await tester.tap(find.byIcon(Icons.remove));
    await tester.pump();
    expect(find.text('1'), findsOneWidget);

    // Tap 0 to reset.
    await tester.tap(find.byTooltip('Reset'));
    await tester.pump();
    expect(find.text('1'), findsNothing);
    expect(find.text('0'), findsNWidgets(2));
  });
}

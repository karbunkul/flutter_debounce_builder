import 'package:debounce_builder/debounce_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget makeTestableApp(Widget child) {
  return MaterialApp(
    home: Scaffold(body: child),
  );
}

void main() {
  testWidgets('adds one to input values', (tester) async {
    await tester.runAsync(() async {
      var message = '';

      const inputKey = Key('text-field');
      const delay = Duration(milliseconds: 50);

      await tester.pumpWidget(
        makeTestableApp(
          DebounceBuilder(
            delay: delay,
            builder: (_, debounce) => TextField(
              key: inputKey,
              onChanged: (val) => debounce(() => message = val),
            ),
          ),
        ),
      );

      await tester.enterText(find.byKey(inputKey), '1');
      expect(message != '1', equals(true));
      await Future.delayed(delay);
      expect(message == '1', equals(true));
    });
  });
}

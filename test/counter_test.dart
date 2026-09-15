import 'package:flutter_test/flutter_test.dart';

import 'package:counter_app/counter.dart';

void main() {
  group('Counter', () {
    test('starts at 0', () {
      expect(Counter().value, 0);
    });

    test('increment adds 1', () {
      final counter = Counter();
      counter.increment();
      expect(counter.value, 1);
    });

    test('decrement subtracts 1', () {
      final counter = Counter();
      counter.decrement();
      expect(counter.value, -1);
    });

    test('reset sets the value back to 0', () {
      final counter = Counter();
      counter.increment();
      counter.increment();
      counter.reset();
      expect(counter.value, 0);
    });
  });
}

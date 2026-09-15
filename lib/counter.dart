/// Plain Dart counter logic, kept separate from the UI so it can be unit tested.
class Counter {
  int value = 0;

  void increment() => value++;

  void decrement() => value--;

  void reset() => value = 0;
}

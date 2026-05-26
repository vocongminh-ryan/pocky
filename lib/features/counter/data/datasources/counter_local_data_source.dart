import 'package:pocky/features/counter/domain/entities/counter.dart';

abstract interface class CounterLocalDataSource {
  Counter getCounter();

  Counter increment();
}

final class InMemoryCounterLocalDataSource implements CounterLocalDataSource {
  int _value = 0;

  @override
  Counter getCounter() {
    return Counter(_value);
  }

  @override
  Counter increment() {
    _value += 1;
    return Counter(_value);
  }
}

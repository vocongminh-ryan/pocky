import 'package:pocky/common/models/counter_model.dart';

abstract interface class CounterStorageService {
  CounterModel read();

  void write(CounterModel counter);
}

final class InMemoryCounterStorageService implements CounterStorageService {
  CounterModel _counter = const CounterModel(value: 0);

  @override
  CounterModel read() {
    return _counter;
  }

  @override
  void write(CounterModel counter) {
    _counter = counter;
  }
}

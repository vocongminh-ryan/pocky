import 'package:flutter/foundation.dart';
import 'package:pocky/core/usecases/usecase.dart';
import 'package:pocky/features/counter/domain/entities/counter.dart';
import 'package:pocky/features/counter/domain/usecases/get_counter.dart';
import 'package:pocky/features/counter/domain/usecases/increment_counter.dart';

final class CounterController extends ChangeNotifier {
  CounterController({
    required GetCounter getCounter,
    required IncrementCounter incrementCounter,
  }) : _getCounter = getCounter,
       _incrementCounter = incrementCounter {
    _counter = _getCounter(const NoParams());
  }

  final GetCounter _getCounter;
  final IncrementCounter _incrementCounter;

  late Counter _counter;

  int get value => _counter.value;

  void increment() {
    _counter = _incrementCounter(const NoParams());
    notifyListeners();
  }
}

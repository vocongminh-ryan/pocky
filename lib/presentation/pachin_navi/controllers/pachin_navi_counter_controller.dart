import 'package:flutter/foundation.dart';
import 'package:pocky/common/models/counter_model.dart';
import 'package:pocky/common/repositories/counter_repository.dart';

final class PachinNaviCounterController extends ChangeNotifier {
  PachinNaviCounterController(this._counterRepository) {
    _counter = _counterRepository.getCounter();
  }

  final CounterRepository _counterRepository;

  late CounterModel _counter;

  int get value => _counter.value;

  void increment() {
    _counter = _counterRepository.increment();
    notifyListeners();
  }
}

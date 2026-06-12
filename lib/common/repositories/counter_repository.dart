import 'package:pocky/common/models/counter_model.dart';
import 'package:pocky/common/services/counter_storage_service.dart';

final class CounterRepository {
  const CounterRepository(this._storageService);

  final CounterStorageService _storageService;

  CounterModel getCounter() {
    return _storageService.read();
  }

  CounterModel increment() {
    final current = _storageService.read();
    final next = current.copyWith(value: current.value + 1);
    _storageService.write(next);
    return next;
  }
}

import 'package:pocky/features/counter/data/datasources/counter_local_data_source.dart';
import 'package:pocky/features/counter/domain/entities/counter.dart';
import 'package:pocky/features/counter/domain/repositories/counter_repository.dart';

final class CounterRepositoryImpl implements CounterRepository {
  const CounterRepositoryImpl(this._localDataSource);

  final CounterLocalDataSource _localDataSource;

  @override
  Counter getCounter() {
    return _localDataSource.getCounter();
  }

  @override
  Counter increment() {
    return _localDataSource.increment();
  }
}

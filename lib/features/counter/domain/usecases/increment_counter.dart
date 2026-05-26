import 'package:pocky/core/usecases/usecase.dart';
import 'package:pocky/features/counter/domain/entities/counter.dart';
import 'package:pocky/features/counter/domain/repositories/counter_repository.dart';

final class IncrementCounter implements UseCase<Counter, NoParams> {
  const IncrementCounter(this._repository);

  final CounterRepository _repository;

  @override
  Counter call(NoParams params) {
    return _repository.increment();
  }
}

import 'package:pocky/features/counter/domain/entities/counter.dart';

abstract interface class CounterRepository {
  Counter getCounter();

  Counter increment();
}

import 'package:pocky/features/counter/data/datasources/counter_local_data_source.dart';
import 'package:pocky/features/counter/data/repositories/counter_repository_impl.dart';
import 'package:pocky/features/counter/domain/repositories/counter_repository.dart';
import 'package:pocky/features/counter/domain/usecases/get_counter.dart';
import 'package:pocky/features/counter/domain/usecases/increment_counter.dart';
import 'package:pocky/features/counter/presentation/controllers/counter_controller.dart';

void configureDependencies() {
  AppDependencies.instance.configure();
}

final class AppDependencies {
  AppDependencies._();

  static final AppDependencies instance = AppDependencies._();

  late final CounterLocalDataSource _counterLocalDataSource;
  late final CounterRepository _counterRepository;

  bool _isConfigured = false;

  void configure() {
    if (_isConfigured) {
      return;
    }

    _counterLocalDataSource = InMemoryCounterLocalDataSource();
    _counterRepository = CounterRepositoryImpl(_counterLocalDataSource);
    _isConfigured = true;
  }

  CounterController counterController() {
    if (!_isConfigured) {
      configure();
    }

    return CounterController(
      getCounter: GetCounter(_counterRepository),
      incrementCounter: IncrementCounter(_counterRepository),
    );
  }
}

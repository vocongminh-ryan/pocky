import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pocky/app/app.dart';
import 'package:pocky/features/counter/data/datasources/counter_local_data_source.dart';
import 'package:pocky/features/counter/data/repositories/counter_repository_impl.dart';
import 'package:pocky/features/counter/domain/usecases/get_counter.dart';
import 'package:pocky/features/counter/domain/usecases/increment_counter.dart';
import 'package:pocky/features/counter/presentation/controllers/counter_controller.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    final dataSource = InMemoryCounterLocalDataSource();
    final repository = CounterRepositoryImpl(dataSource);
    final controller = CounterController(
      getCounter: GetCounter(repository),
      incrementCounter: IncrementCounter(repository),
    );

    await tester.pumpWidget(PockyApp(counterController: controller));

    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}

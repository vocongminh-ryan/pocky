import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pocky/app/app.dart';
import 'package:pocky/app/router/app_router.dart';
import 'package:pocky/common/repositories/counter_repository.dart';
import 'package:pocky/common/services/counter_storage_service.dart';
import 'package:pocky/config/app_config.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    final storageService = InMemoryCounterStorageService();
    final counterRepository = CounterRepository(storageService);
    final router = AppRouter(counterRepository: counterRepository).router();

    await tester.pumpWidget(
      PockyApp(config: AppConfig.development(), router: router),
    );

    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}

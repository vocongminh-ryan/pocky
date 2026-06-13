import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pocky/app/app.dart';
import 'package:pocky/app/router/app_router.dart';
import 'package:pocky/config/app_config.dart';

void main() {
  testWidgets('Pocky home shows private social wallet UI', (
    WidgetTester tester,
  ) async {
    final router = AppRouter().router();

    await tester.pumpWidget(
      PockyApp(config: AppConfig.development(), router: router),
    );

    expect(find.text('Pocky'), findsOneWidget);
    expect(find.text('Private moments, honest money'), findsOneWidget);
    expect(find.text('Close friends only'), findsOneWidget);
    expect(find.text('Group wallet'), findsOneWidget);
    expect(find.byIcon(Icons.camera_alt_rounded), findsOneWidget);
  });

  testWidgets('Private circle page opens from home', (
    WidgetTester tester,
  ) async {
    final router = AppRouter().router();

    await tester.pumpWidget(
      PockyApp(config: AppConfig.development(), router: router),
    );

    await tester.tap(find.byIcon(Icons.group_outlined));
    await tester.pumpAndSettle();

    expect(find.text('Circle privacy'), findsOneWidget);
    expect(
      find.text('Invite a close friend and start a shared wallet together.'),
      findsOneWidget,
    );
  });
}

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pocky/app/app.dart';
import 'package:pocky/app/router/app_router.dart';
import 'package:pocky/config/app_config.dart';

Future<void> bootstrap(AppConfig config) async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      FlutterError.onError = (details) {
        FlutterError.presentError(details);
        Zone.current.handleUncaughtError(
          details.exception,
          details.stack ?? StackTrace.current,
        );
      };

      final router = AppRouter().router();

      runApp(PockyApp(config: config, router: router));
    },
    (error, stackTrace) {
      if (kDebugMode) {
        debugPrint('Uncaught app error: $error');
        debugPrintStack(stackTrace: stackTrace);
      }
    },
  );
}

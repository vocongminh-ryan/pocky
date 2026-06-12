import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pocky/config/app_config.dart';
import 'package:pocky/constants/app_theme.dart';

class PockyApp extends StatelessWidget {
  const PockyApp({super.key, required this.config, required this.router});

  final AppConfig config;
  final GoRouter router;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: config.appName,
      theme: AppTheme.light,
      routerConfig: router,
      debugShowCheckedModeBanner: config.showDebugBanner,
    );
  }
}

enum AppFlavor { development, staging, production }

final class AppConfig {
  const AppConfig({
    required this.flavor,
    required this.appName,
    required this.showDebugBanner,
  });

  factory AppConfig.development() {
    return const AppConfig(
      flavor: AppFlavor.development,
      appName: 'Pocky Dev',
      showDebugBanner: true,
    );
  }

  factory AppConfig.staging() {
    return const AppConfig(
      flavor: AppFlavor.staging,
      appName: 'Pocky Staging',
      showDebugBanner: true,
    );
  }

  factory AppConfig.production() {
    return const AppConfig(
      flavor: AppFlavor.production,
      appName: 'Pocky',
      showDebugBanner: false,
    );
  }

  final AppFlavor flavor;
  final String appName;
  final bool showDebugBanner;
}

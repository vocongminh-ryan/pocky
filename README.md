# pocky

A Flutter project configured with a feature-first clean architecture structure.

## Architecture

```text
lib/
  app/
    app.dart
  core/
    usecases/
      usecase.dart
  features/
    counter/
      data/
        datasources/
        repositories/
      domain/
        entities/
        repositories/
        usecases/
      presentation/
        controllers/
        pages/
  injection_container.dart
  main.dart
```

## Layer Rules

- `presentation` owns Flutter widgets and controllers.
- `domain` owns entities, repository contracts, and use cases.
- `data` implements domain repository contracts and talks to local or remote data sources.
- `core` contains reusable cross-feature abstractions.
- `main.dart` only bootstraps dependencies and starts the app.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

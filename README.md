# pocky

A Flutter project configured with an app/common/presentation architecture.

## Architecture

```text
lib/
├── app/                 # GoRouter, root App widget, observers
├── bootstrap.dart       # Early app setup, errors, dependency wiring
├── config/              # Environment and settings
├── common/
│   ├── bloc/            # Cross-cutting blocs
│   ├── cubit/           # Shared cubits
│   ├── repositories/    # Data + domain mapping
│   ├── services/        # API clients, notifications, storage, ...
│   ├── models/          # Shared models
│   └── analytics/       # Analytics events and schemas
├── constants/           # Themes, typography, spacing
├── presentation/
│   ├── pachin_navi/     # Navi, gacha, maps, home
│   └── pachinator/      # Social
├── l10n/                # ARB files and generated l10n
└── main_*.dart          # Flavor entrypoints
```

## Entry Points

- `lib/main.dart` defaults to development.
- `lib/main_dev.dart` starts the development flavor.
- `lib/main_staging.dart` starts the staging flavor.
- `lib/main_prod.dart` starts the production flavor.

Run a flavor with:

```sh
flutter run -t lib/main_dev.dart
```

## Layer Rules

- `app` owns routing, app shell, and navigation observers.
- `bootstrap.dart` owns early initialization and global error handling.
- `config` owns flavor and environment settings.
- `common` owns reusable repositories, services, models, analytics, and shared state.
- `constants` owns design constants such as theme and spacing.
- `presentation` owns screens, widgets, and presentation controllers.

# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

```bash
# Run the app (choose a target device)
flutter run

# Run on a specific device
flutter run -d ios
flutter run -d android
flutter run -d chrome

# Run tests
flutter test

# Run a single test file
flutter test test/widget_test.dart

# Analyze code (lint)
flutter analyze

# Format code
dart format lib/

# Get/update dependencies
flutter pub get
flutter pub upgrade

# Build
flutter build apk          # Android
flutter build ios          # iOS (requires Xcode)
flutter build web          # Web
```

## Project Structure

```
lib/
  main.dart          # App entry point and root widget
test/
  widget_test.dart   # Widget tests
```

The app is currently in early development — `lib/main.dart` holds only the default Flutter counter template. All feature code will live under `lib/`.

## Stack

- Flutter (Dart SDK ^3.10.3)
- Material Design (`uses-material-design: true`)
- Linting: `flutter_lints` (rules in `analysis_options.yaml`)
- Target platforms: Android, iOS, Web, macOS, Linux, Windows

## Architecture Notes

As the app grows, follow Flutter conventions:
- Organize features under `lib/features/` or `lib/screens/`
- Shared widgets go in `lib/widgets/`
- Models/data classes in `lib/models/`
- Use `StatelessWidget` by default; reach for `StatefulWidget` or a state management solution only when needed
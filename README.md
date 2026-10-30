# Spotify

A Flutter mobile application with a Spotify-inspired UI and a modular architecture for onboarding, authentication, home browsing, profile management, and media playback.

## Overview

This project is a Dart/Flutter application built for mobile platforms and integrated with Firebase services. It follows a clean, layered structure and includes state management with BLoC, dependency injection with GetIt, and persistent state handling with HydratedBloc.

The codebase is organized into feature modules under `lib/prestation`, with supporting layers for app configuration, repositories, models, and use cases.

## Features

- Splash and intro screens
- Theme selection / mode switching
- Authentication flow
- Home screen
- Profile screen
- Audio playback / media player module
- Firebase initialization and configuration
- Clean architecture separation between UI, domain, and data layers

## Tech Stack

- Flutter
- Dart
- Firebase Core
- Firebase Auth
- Cloud Firestore
- flutter_bloc
- hydrated_bloc
- get_it
- dartz
- just_audio
- cached_network_image
- flutter_svg
- path_provider

## Project Structure

```text
spotify/
├── android/
├── ios/
├── assets/
├── lib/
│   ├── common/
│   ├── core/
│   │   ├── configs/
│   │   └── usecase/
│   ├── data/
│   │   ├── models/
│   │   ├── repository/
│   │   └── sources/
│   ├── domain/
│   ├── prestation/
│   │   ├── auth/
│   │   ├── choose_mode/
│   │   ├── home/
│   │   ├── intro/
│   │   ├── profile/
│   │   ├── quran_player/
│   │   └── splash/
│   ├── firebase_options.dart
│   ├── main.dart
│   ├── service_locator.dart
│   └── ...
├── test/
├── analysis_options.yaml
├── firebase.json
├── pubspec.yaml
├── README.md
├── .gitignore
└── .metadata
```

## Main App Entry

The app starts from `lib/main.dart`, where the project:

- initializes Flutter bindings
- initializes HydratedBloc storage
- configures Firebase
- registers dependencies through `initializeDependencies()`
- launches the app with a `ThemeCubit`-managed theme

## Architecture

The project is organized using a layered architecture approach:

- `core/`: shared configuration and reusable app logic
- `data/`: repositories, models, and data providers
- `domain/`: business logic and use case abstractions
- `prestation/`: UI screens and feature-specific presentation logic

This separation makes the app easier to extend and maintain as new screens or data sources are added.

## Getting Started

1. Install Flutter SDK.
2. Clone the repository.
3. Install dependencies:

```bash
flutter pub get
```

4. Run the app:

```bash
flutter run
```

## Firebase Setup

The project includes Firebase configuration via:

- `lib/firebase_options.dart`
- `firebase.json`

Before running the app on a real device or emulator, ensure Firebase is configured correctly for the target platform.

## Notes

This repository appears to be an evolving Flutter app with a strong emphasis on media UI and player experiences. The project structure suggests a custom app with onboarding and playback flows, rather than a stock starter template.

## License

This project does not currently declare a custom license in the repository root README.

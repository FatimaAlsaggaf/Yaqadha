# Yaqadha | يقظة

![Yaqadha project poster](https://fatima-alsaggaf-portfolio.vercel.app/images/projects/yaqadha.jpg)

Yaqadha is an AI-powered wellness application that encourages healthier lifestyles through personalized challenges, gamification, and community-driven activities.


## The problem

Building healthy habits requires consistency. Yaqadha addresses that challenge by combining everyday activities with shared goals, visible progress, and community participation.

## The idea

Yaqadha encourages an active lifestyle through personalized challenges and rewards. Regional competitions across Saudi Arabia allow users to represent their region and work toward shared wellness goals inspired by Saudi Vision 2030.

## Features

- **Daily and personalized challenges:** Make healthy activities part of a regular routine.
- **Habit tracking and streaks:** Follow progress and maintain consistency.
- **Points and rewards:** Earn points by participating in challenges.
- **Community interaction:** Connect through communities, posts, and comments.
- **AI chatbot support:** Provide an interactive support experience.
- **City and regional challenges:** Encourage participation in shared wellness goals across Saudi Arabia.

## Technologies & tools

| Area | Technology |
| --- | --- |
| App development | FlutterFlow, Flutter, Dart |
| Backend | Firebase |
| AI integration | Gemini API |
| Activity tracking | Device sensors (custom step-detection code) |

## Achievement

🏆 **Award-Winning Project — Winner of the 6th Academic Projects Competition, King Saud University.**

Project references: [Hackathonat](https://x.com/hackathonat/status/2028184903179751630?s=46) · [KSU Software Engineering](https://x.com/ksu_swe/status/2030716932337394169?s=46).

## Project structure

```text
lib/
  pages/          Application screens
  sign_in/        Account flows
  components/     Reusable interface components
  custom_code/    Custom actions and step detection
  backend/        Firebase integration, schemas, and API helpers
  flutter_flow/   Generated utilities and navigation
firebase/         Firestore rules, indexes, and Cloud Functions
assets/           Images, fonts, and other application assets
android/          Android project
ios/              iOS project
web/              Web project
```

## Getting started

The source code was exported from FlutterFlow. The project requires Dart `>=3.0.0 <4.0.0` and a compatible Flutter SDK; the exact working Flutter version has not yet been verified.

1. Install Flutter and run `flutter doctor` for your target platform.
2. Configure a development Firebase project and any required API integrations. Review the Firebase rules and functions before deployment.
3. Run the following commands from the project root:

```bash
flutter pub get
flutter analyze
flutter run
```

## Development notes

- The source code was exported from FlutterFlow.
- A development Firebase project and API configuration are required to run the application.

Sensitive credentials are excluded from the public repository.

# Yaqadha | يقظة

![Yaqadha project poster](https://fatima-alsaggaf-portfolio.vercel.app/images/projects/yaqadha.jpg)

A digital wellness platform that makes healthy habits more engaging through personalized challenges, gamification, community interaction, and progress tracking.


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
| Activity integration listed in the portfolio | Google Fit API |

The supplied Flutter export also contains custom step-detection code using device sensors. The Google Fit integration listed in the portfolio has not yet been verified in this export.

## Achievement

**Winner of the 6th Academic Projects Competition.**

References linked from the portfolio: [Hackathonat](https://x.com/hackathonat/status/2028184903179751630?s=46) · [KSU Software Engineering](https://x.com/ksu_swe/status/2030716932337394169?s=46).

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

The source was exported from FlutterFlow. Its manifest requires Dart `>=3.0.0 <4.0.0`, and its original documentation specifies Flutter stable. The exact working Flutter version still needs to be verified.

1. Install a compatible Flutter SDK and run `flutter doctor` for your target platform.
2. Configure your own development Firebase project. Replace the Firebase client configuration and review the rules and functions in `firebase/` before deployment.
3. Run these commands from the project root:

```sh
flutter pub get
flutter analyze
flutter run
```

Use a supported physical device to validate step tracking.

## Repository notes

- Local Dart import/export targets were checked in the supplied export. Compilation and runtime behavior have not been verified.
- Embedded service keys were removed from the prepared source. The affected integrations require reconfiguration; private service credentials should be handled by a backend rather than embedded in a distributed client.
- Browser profiles and generated build caches are excluded from the prepared source.


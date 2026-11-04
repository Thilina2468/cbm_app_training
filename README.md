# KYC Practice App

A Flutter practice app for a KYC onboarding flow. It has a login screen, an onboarding checklist with four steps (About you, Your identity, Other Documents, Billing Proof) and a success screen. Each step keeps its own progress with `flutter_bloc`, and the Next button turns active once every step is complete.

## Run

```bash
fvm flutter pub get
fvm flutter run
```

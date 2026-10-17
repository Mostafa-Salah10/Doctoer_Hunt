# Doctor Hunt

Doctor Hunt is a Flutter app for finding doctors and booking appointments. It has separate patient and admin areas.

## Features

### Patients
- Browse doctors by speciality, view featured and popular doctors, and search by name.
- View doctor details and save doctors to a favourites list.
- Choose an available date and time to book an appointment.
- View appointments, cancel upcoming appointments, and rate completed visits.
- Edit profile details and choose the app language and theme.

### Admin
- View doctor statistics and manage doctor profiles.
- Set doctors' working days and appointment availability.
- Review appointments and manage their status.

The app supports English and Arabic, along with light and dark themes.

## User flow

On first launch, the app shows onboarding, followed by sign in. Patients can create an account or sign in. After signing in, they can browse or search for a doctor, view the doctor's details, select an available appointment time, and manage their appointments from the appointments area.

Admin users sign in with an admin account to manage doctors, availability, and appointments.

## Technologies

- Flutter and Dart
- Firebase Authentication and Cloud Firestore
- `flutter_bloc` for state management
- `go_router` for navigation
- `get_it` for dependency injection
- `shared_preferences` for local settings
- `slang` and Flutter localization support for English and Arabic
- `flutter_screenutil` for responsive sizing
- `image_picker` and `cached_network_image` for selecting and displaying images

## Download APK

[Download Doctor Hunt APK](https://github.com/Mostafa-Salah10/Doctoer_Hunt/releases/latest/download/app-release.apk)

## Demo

[Watch Doctor Hunt Demo](VIDEO_LINK_HERE)
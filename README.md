# Protirokkha

A personal safety and emergency response Flutter application.

## Features

- **Emergency Contacts**: Add and manage emergency contact numbers
- **KYC Verification**: Face verification for identity verification
- **Home Screen**: Interactive map with defenders and emergency help button
- **Defender Network**: View nearby defenders and safety zones

## Getting Started

### Prerequisites

- Flutter SDK (>=3.0.0)
- Dart SDK

### Installation

1. Clone the repository
```bash
git clone https://github.com/ahemon369/Protirokkha.git
cd Protirokkha
```

2. Install dependencies
```bash
flutter pub get
```

3. Run the app
```bash
flutter run
```

## Project Structure

```
lib/
├── config/
│   └── routes.dart              # App routing configuration
├── core/
│   ├── constants/               # App constants (colors, spacing, text styles)
│   ├── theme/                   # App theme configuration
│   └── widgets/                 # Shared widgets (CustomButton, CustomTextField, AppLogo)
├── features/
│   ├── emergency/
│   │   └── screens/            # Emergency contacts screen
│   ├── kyc/
│   │   └── screens/            # KYC verification screen
│   └── home/
│       └── screens/            # Home screen with map and defenders
└── main.dart                    # App entry point
```

## Screens

### 1. Emergency Contacts Screen
- Add 3 or more emergency contact numbers
- Submit emergency contacts for registration

### 2. KYC Verification Screen
- Take selfie for identity verification
- Photo taking tips dialog
- Face scanning interface

### 3. Home Screen
- Interactive map with defender zones
- Two states:
  - Defenders nearby (green zone with defender info)
  - No defenders (warning banner with invite option)
- Emergency help button
- Draggable bottom sheet with defender information

## Design Specifications

### Colors
- Primary Red: `#D32F2F`
- Secondary Green: `#388E3C`
- Warning Orange/Yellow: `#FF9800` / `#FFC107`
- Background: White `#FFFFFF`
- Light Grey: `#F5F5F5`

### Typography
- Titles: Bold, 20-24sp
- Body: Regular, 14-16sp
- Labels: Medium, 12-14sp

## License

This project is licensed under the MIT License.

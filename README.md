# Protirokkha (প্রতিরক্ষা)

A modern, secure Flutter mobile app for community safety and emergency response in Bangladesh.

## 🛡️ Overview

Protirokkha is a community safety application that enables users to:
- Send emergency SOS alerts
- Connect with nearby defenders
- Manage emergency contacts
- Stay informed about safety news
- Verify identity through KYC

## ✨ Features

### 🔐 Authentication Flow
- **Onboarding**: Interactive 3-page introduction in Bengali
- **Phone Login**: Bangladesh phone number authentication (+88 prefix)
- **OTP Verification**: 6-digit code verification with timer
- **Account Setup**: NID-compliant user registration

### 🚨 Emergency Features
- **SOS Button**: Animated floating button for emergency alerts
- **Victim Mode**: Bottom sheet showing help status, timer, and nearby defenders
- **Defender Mode**: Accept/reject emergency requests with navigation
- **Emergency Contacts**: Manage list of emergency contacts

### 📱 Core Screens
1. **Onboarding** - Welcome screens with Bengali text
2. **Phone Login** - Phone number input with +88 prefix
3. **OTP Verification** - 6-digit code input with resend option
4. **Account Setup** - User registration form (Name, Email, DOB, Gender)
5. **KYC Verification** - Face verification placeholder
6. **Emergency Contacts** - Add/edit/delete emergency contacts
7. **Home** - Google Maps placeholder with location marker
8. **Feed** - Safety news and tips in Bengali
9. **Profile** - User profile with settings
10. **SOS Button** - Floating emergency button
11. **Victim Bottom Sheet** - Emergency alert status for victims
12. **Defender Bottom Sheet** - Emergency response for defenders

## 🎨 Design System

### Color Palette
- **Primary Red**: `#D32F2F` - Emergency/SOS actions
- **Secondary Green**: `#388E3C` - Defender/Safe status
- **Background**: `#F5F5F5` / White
- **Accent Yellow**: `#FFA726` - Warnings
- **Text**: Dark grey/black on light, white on colored backgrounds

### UI Components
- Rounded corners (12-16px radius)
- Soft shadows (elevation 2-4)
- Material 3 design
- Bengali typography throughout
- Responsive layouts

## 📁 Project Structure

```
lib/
├── main.dart                 # App entry point
├── app/
│   ├── app.dart             # Main app widget
│   ├── routes.dart          # Navigation routes
│   └── theme.dart           # App theme configuration
├── features/
│   ├── onboarding/          # Onboarding screens
│   ├── auth/                # Authentication screens
│   ├── kyc/                 # KYC verification
│   ├── emergency/           # Emergency contacts
│   ├── home/                # Home screen with map
│   ├── sos/                 # SOS button and bottom sheets
│   ├── feed/                # News feed
│   └── profile/             # User profile
└── shared/
    └── widgets/             # Reusable components
        ├── custom_button.dart
        ├── custom_text_field.dart
        └── app_logo.dart
```

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (^3.5.0)
- Dart SDK
- Android Studio / VS Code
- Android/iOS device or emulator

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/ahemon369/Protirokkha.git
   cd Protirokkha
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### Development

- **Format code**: `flutter format .`
- **Analyze code**: `flutter analyze`
- **Run tests**: `flutter test`

## 🔧 Configuration

### Dependencies
- `google_maps_flutter: ^2.9.0` - Google Maps integration
- `go_router: ^14.6.2` - Navigation and routing
- `cupertino_icons: ^1.0.8` - iOS-style icons

## 📖 Usage Guide

### Navigation Flow
1. **First Launch**: Onboarding screens → Phone login
2. **Authentication**: Phone number → OTP verification → Account setup
3. **Setup**: KYC verification → Emergency contacts → Home screen
4. **Main App**: Home ↔ Feed ↔ Emergency ↔ Profile

### SOS Emergency
1. Tap the red SOS button on home screen
2. Emergency alert is sent to nearby defenders
3. View help status in victim bottom sheet
4. Cancel if false alarm

### Defender Response
1. Receive emergency notification
2. View victim details in defender bottom sheet
3. Accept to navigate or reject if unable to help

## 🌐 Localization

The app is primarily in **Bengali (বাংলা)** with key features:
- All UI text in Bengali
- Bengali number formatting
- Bengali date/time display
- English fallback for technical terms

## 🔒 Security Features

- Phone number authentication
- OTP-based verification
- NID-compliant registration
- Location privacy controls
- Secure emergency broadcasts

## 🎯 Future Enhancements

- [ ] Firebase Authentication integration
- [ ] Real-time Firestore database
- [ ] Google Maps API integration
- [ ] Push notifications
- [ ] Real-time location tracking
- [ ] Chat between victim and defender
- [ ] Community ratings and reviews
- [ ] Multi-language support (English, Bengali)

## 📱 Screenshots

> Screenshots will be added once the app is running on a device/emulator

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 👥 Authors

- **ahemon369** - Initial work

## 🙏 Acknowledgments

- Design inspiration from modern safety apps
- Bengali community for language support
- Flutter team for the amazing framework

## 📞 Support

For support, email support@protirokkha.com or join our community forum.

---

Made with ❤️ in Bangladesh 🇧🇩

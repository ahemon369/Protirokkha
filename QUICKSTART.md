# Quick Start Guide - Protirokkha

## 🚀 Running the App

Since Flutter SDK installation may have issues in this environment, here's how to run the app in your local development environment:

### Prerequisites Checklist
- [ ] Flutter SDK installed (version 3.5.0 or higher)
- [ ] Android Studio or VS Code with Flutter extension
- [ ] Android emulator or iOS simulator configured
- [ ] Physical device connected (optional)

### Step-by-Step Instructions

#### 1. Clone and Setup
```bash
# Clone the repository
git clone https://github.com/ahemon369/Protirokkha.git
cd Protirokkha

# Check Flutter installation
flutter doctor

# Get dependencies
flutter pub get
```

#### 2. Verify Installation
```bash
# Check for any issues
flutter doctor -v

# List available devices
flutter devices
```

#### 3. Run the App
```bash
# Run on default device
flutter run

# Run on specific device
flutter run -d <device-id>

# Run in release mode
flutter run --release
```

#### 4. Hot Reload
While app is running:
- Press `r` - Hot reload
- Press `R` - Hot restart
- Press `q` - Quit

## 🎯 Testing the Features

### 1. Onboarding Flow
1. Launch app → See onboarding screens
2. Swipe left/right to navigate
3. Tap "পরবর্তী" to go to next page
4. On last page, tap "শুরু করুন"

### 2. Authentication Flow
1. **Phone Login**:
   - Enter 11-digit phone number (e.g., 01838845960)
   - Tap "পরবর্তী"

2. **OTP Verification**:
   - Enter any 6 digits (mock)
   - Timer counts down from 05:00
   - Tap "Resend" when timer expires
   - Tap "পরবর্তী" to continue

3. **Account Setup**:
   - Enter name in Bengali or English
   - Enter email address
   - Select birthday from calendar
   - Select gender from dropdown
   - Tap "Submit"

### 3. Home and Navigation
1. **Home Screen**:
   - See map placeholder
   - Floating SOS button visible at bottom
   - Bottom navigation bar with 4 tabs

2. **SOS Emergency**:
   - Tap red pulsing SOS button
   - Victim bottom sheet appears
   - Timer starts counting
   - Toggle location sharing
   - Tap "বাতিল করুন" to cancel (confirmation dialog)

3. **Feed**:
   - Tap "ফিড" in bottom navigation
   - Pull down to refresh
   - Tap any news card to read full article
   - Category badges show different colors

4. **Profile**:
   - Tap "প্রোফাইল" in bottom navigation
   - View user stats
   - Tap any settings item
   - Tap "লগ আউট" (confirmation dialog)

## 📱 Platform-Specific Setup

### Android
```bash
# Run on Android
flutter run -d android

# Generate APK
flutter build apk --release

# Install APK
flutter install
```

### iOS
```bash
# Run on iOS
flutter run -d ios

# Generate IPA
flutter build ios --release
```

### Web (Optional)
```bash
# Run on web
flutter run -d chrome

# Build for web
flutter build web
```

## 🔧 Common Issues

### Issue: "Flutter command not found"
**Solution**: Add Flutter to PATH
```bash
export PATH="$PATH:/path/to/flutter/bin"
```

### Issue: "SDK not found"
**Solution**: Run flutter doctor and follow instructions
```bash
flutter doctor
```

### Issue: "No devices found"
**Solution**: 
- Start Android emulator
- Connect physical device with USB debugging
- Enable iOS simulator

### Issue: "Pub get failed"
**Solution**: Clear cache and retry
```bash
flutter clean
flutter pub get
```

### Issue: "Build failed"
**Solution**: 
```bash
flutter clean
flutter pub get
flutter run
```

## 🎨 UI Customization

### Changing Colors
Edit `lib/app/theme.dart`:
```dart
static const Color primaryRed = Color(0xFFD32F2F); // Change this
static const Color secondaryGreen = Color(0xFF388E3C); // Change this
```

### Changing Text
Edit screen files in `lib/features/*/screens/`:
- All Bengali text is in string literals
- Easy to find and replace

### Adding Images
1. Create `assets/images/` folder
2. Add images to folder
3. Update `pubspec.yaml`:
```yaml
flutter:
  assets:
    - assets/images/
```
4. Use in code:
```dart
Image.asset('assets/images/logo.png')
```

## 📊 Performance Tips

### Debug Mode
- Slower performance
- Larger app size
- Hot reload enabled

### Release Mode
- Optimized performance
- Smaller app size
- No hot reload

```bash
# Always test in release mode before deployment
flutter run --release
```

## 🧪 Testing

### Unit Tests
```bash
# Run all tests
flutter test

# Run specific test
flutter test test/widget_test.dart
```

### Integration Tests
```bash
# Run integration tests
flutter test integration_test/
```

### Widget Tests
```bash
# Run widget tests
flutter test test/widget/
```

## 📦 Building for Production

### Android Release
```bash
# Create release APK
flutter build apk --release

# Create app bundle (recommended)
flutter build appbundle --release
```

### iOS Release
```bash
# Create iOS release
flutter build ios --release

# Create IPA
flutter build ipa --release
```

## 🔐 Environment Setup

For production, you'll need:

### Firebase Setup
1. Create Firebase project
2. Add Android/iOS apps
3. Download `google-services.json` (Android)
4. Download `GoogleService-Info.plist` (iOS)
5. Update dependencies

### Google Maps Setup
1. Get API key from Google Cloud Console
2. Add to `AndroidManifest.xml`:
```xml
<meta-data
    android:name="com.google.android.geo.API_KEY"
    android:value="YOUR_API_KEY"/>
```
3. Add to `AppDelegate.swift` (iOS)

## 📝 Development Workflow

1. **Make changes** to Dart files
2. **Hot reload** (`r` in terminal)
3. **Test** the feature
4. **Commit** changes
5. **Push** to repository

## 🎓 Learning Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [Dart Language Tour](https://dart.dev/guides/language/language-tour)
- [Material Design 3](https://m3.material.io/)
- [Flutter Cookbook](https://flutter.dev/docs/cookbook)

## 💡 Tips

1. **Hot Reload**: Use `r` frequently while developing
2. **DevTools**: Use Flutter DevTools for debugging
3. **Logging**: Add print statements for debugging
4. **Formatting**: Run `flutter format .` before committing
5. **Analysis**: Run `flutter analyze` to find issues

## 📞 Need Help?

- Check [Flutter documentation](https://flutter.dev/docs)
- Ask on [StackOverflow](https://stackoverflow.com/questions/tagged/flutter)
- Join [Flutter Discord](https://discord.gg/flutter)

---

Happy Coding! 🚀

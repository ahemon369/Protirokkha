# Protirokkha Architecture Visualization

## 📐 Project Structure

```
Protirokkha/
│
├── 📄 Configuration Files
│   ├── pubspec.yaml              # Dependencies & project config
│   ├── analysis_options.yaml     # Linting rules
│   └── .gitignore               # Git ignore rules
│
├── 📚 Documentation (7 files)
│   ├── README.md                # Main project documentation
│   ├── QUICKSTART.md            # Quick start guide
│   ├── UI_IMPLEMENTATION.md     # UI details & specs
│   ├── FEATURES.md              # Feature list & roadmap
│   ├── PROJECT_SUMMARY.md       # Complete project summary
│   ├── CONTRIBUTING.md          # Contribution guidelines
│   └── ARCHITECTURE.md          # This file
│
└── 📱 lib/
    │
    ├── main.dart                # App entry point
    │
    ├── 🎨 app/                  # Core app configuration
    │   ├── app.dart            # Main MaterialApp widget
    │   ├── routes.dart         # Navigation routes
    │   └── theme.dart          # Material 3 theme
    │
    ├── ✨ features/             # Feature modules
    │   │
    │   ├── 🎯 onboarding/
    │   │   └── screens/
    │   │       └── onboarding_screen.dart
    │   │
    │   ├── 🔐 auth/
    │   │   └── screens/
    │   │       ├── phone_login_screen.dart
    │   │       ├── otp_verification_screen.dart
    │   │       └── account_setup_screen.dart
    │   │
    │   ├── 🆔 kyc/
    │   │   └── screens/
    │   │       └── kyc_verification_screen.dart
    │   │
    │   ├── 📞 emergency/
    │   │   └── screens/
    │   │       └── emergency_contacts_screen.dart
    │   │
    │   ├── 🏠 home/
    │   │   └── screens/
    │   │       └── home_screen.dart
    │   │
    │   ├── 🚨 sos/
    │   │   └── widgets/
    │   │       ├── sos_button.dart
    │   │       ├── victim_bottom_sheet.dart
    │   │       └── defender_bottom_sheet.dart
    │   │
    │   ├── 📰 feed/
    │   │   └── screens/
    │   │       └── feed_screen.dart
    │   │
    │   └── 👤 profile/
    │       └── screens/
    │           └── profile_screen.dart
    │
    └── 🔧 shared/
        └── widgets/
            ├── custom_button.dart
            ├── custom_text_field.dart
            └── app_logo.dart
```

## 🔄 Navigation Flow

```
┌─────────────────────────────────────────────────────────┐
│                    App Start                             │
│                       ↓                                  │
│                 Onboarding (3 pages)                     │
│                       ↓                                  │
│                 Phone Login                              │
│                       ↓                                  │
│              OTP Verification                            │
│                       ↓                                  │
│               Account Setup                              │
│                       ↓                                  │
│             KYC Verification                             │
│                       ↓                                  │
│            Emergency Contacts                            │
│                       ↓                                  │
├─────────────────────────────────────────────────────────┤
│                  Main App (Home)                         │
│           ┌──────────┬───────────┬──────────┐           │
│           ↓          ↓           ↓          ↓           │
│        Home       Feed      Emergency    Profile        │
│           │                      │                       │
│           │                      ↓                       │
│           │            Emergency Contacts                │
│           │                                              │
│           └─→ SOS Button ─→ Victim Bottom Sheet         │
│                         └─→ Defender Bottom Sheet       │
└─────────────────────────────────────────────────────────┘
```

## 🎨 Screen Architecture

### Authentication Flow
```
┌──────────────────┐
│  Onboarding      │  PageView with 3 pages
│  Screen          │  → Bengali welcome text
└────────┬─────────┘  → Language badge
         ↓            → Page indicators
┌──────────────────┐
│  Phone Login     │  Logo + phone input
│  Screen          │  → +88 prefix
└────────┬─────────┘  → Validation
         ↓
┌──────────────────┐
│  OTP             │  6-digit input boxes
│  Verification    │  → Timer (5:00)
└────────┬─────────┘  → Resend option
         ↓
┌──────────────────┐
│  Account         │  Form with:
│  Setup           │  → Name field
└──────────────────┘  → Email field
                      → Birthday picker
                      → Gender dropdown
```

### Main App Flow
```
┌────────────────────────────────────┐
│         Home Screen                │
│                                    │
│  ┌──────────────────────────────┐ │
│  │   Google Maps Placeholder    │ │
│  │   (Location marker)          │ │
│  └──────────────────────────────┘ │
│                                    │
│         ┌──────────┐               │
│         │   SOS    │ ← Pulsing     │
│         │  Button  │   Animation   │
│         └──────────┘               │
│                                    │
│  ┌───────────────────────────────┐│
│  │ Home │ Feed │ Emergency │ Profile││
│  └───────────────────────────────┘│
└────────────────────────────────────┘
```

## 🧩 Component Hierarchy

### Shared Components
```
CustomButton
├── Used in: All screens
├── Props: text, onPressed, loading, colors
└── Features: Loading state, custom styling

CustomTextField
├── Used in: Auth, Account Setup
├── Props: label, hint, validation, icons
└── Features: Formatters, focus management

AppLogo
├── Used in: Phone Login, App Bar
├── Props: size, color
└── Features: Shield + fist icon, shadows
```

### Screen-Specific Widgets
```
SosButton
├── Used in: Home Screen
├── Features: Pulsing animation, glow effect
└── Triggers: Victim Bottom Sheet

VictimBottomSheet
├── Features: Timer, location toggle, status
└── Actions: Cancel with confirmation

DefenderBottomSheet
├── Features: Victim info, distance
└── Actions: Accept/Reject
```

## 🎯 Data Flow

```
┌─────────────────────────────────────────┐
│            User Interaction             │
└───────────────┬─────────────────────────┘
                ↓
┌─────────────────────────────────────────┐
│          Widget (UI Layer)              │
│  - Displays data                        │
│  - Handles user input                   │
└───────────────┬─────────────────────────┘
                ↓
┌─────────────────────────────────────────┐
│      State Management (setState)        │
│  - Manages widget state                 │
│  - Triggers rebuilds                    │
└───────────────┬─────────────────────────┘
                ↓
┌─────────────────────────────────────────┐
│        Mock Data (Currently)            │
│  - Hardcoded data                       │
│  - Placeholder for backend              │
└─────────────────────────────────────────┘

Future: Add Repository Layer
        Add API Service Layer
        Add Firebase Integration
```

## 🎨 Theme Architecture

```
AppTheme (theme.dart)
│
├── Color Palette
│   ├── Primary Red (#D32F2F)
│   ├── Secondary Green (#388E3C)
│   ├── Background (#F5F5F5)
│   ├── Accent Yellow (#FFA726)
│   └── Text Colors
│
├── Text Themes
│   ├── Headlines (Bengali support)
│   ├── Body text
│   └── Captions
│
├── Component Themes
│   ├── ElevatedButton
│   ├── InputDecoration
│   ├── Card
│   └── AppBar
│
└── Custom Properties
    ├── Border radius: 12px
    ├── Elevation: 2-4
    └── Padding/Spacing
```

## 🚨 Emergency System Architecture

```
┌─────────────────────────────────────────┐
│           SOS Button Pressed            │
└───────────────┬─────────────────────────┘
                ↓
┌─────────────────────────────────────────┐
│      Show Victim Bottom Sheet           │
│  ┌───────────────────────────────────┐  │
│  │ Start timer                       │  │
│  │ Get user location                 │  │
│  │ Find nearby defenders             │  │
│  │ Send alert (mock)                 │  │
│  └───────────────────────────────────┘  │
└───────────────┬─────────────────────────┘
                ↓
┌─────────────────────────────────────────┐
│      Defenders Receive Alert            │
│  ┌───────────────────────────────────┐  │
│  │ Show Defender Bottom Sheet        │  │
│  │ Display victim info & distance    │  │
│  │ Options: Accept / Reject          │  │
│  └───────────────────────────────────┘  │
└───────────────┬─────────────────────────┘
                ↓
┌─────────────────────────────────────────┐
│      Defender Responds                  │
│  Accept → Navigate to victim            │
│  Reject → Close bottom sheet            │
└─────────────────────────────────────────┘
```

## 📊 State Management (Current)

```
StatefulWidget
│
├── State Variables
│   ├── Controllers (TextEditingController)
│   ├── Booleans (loading, toggle states)
│   ├── Timers (OTP, Emergency)
│   └── Lists (contacts, news)
│
├── setState()
│   └── Triggers rebuild when data changes
│
└── Lifecycle Methods
    ├── initState() - Setup
    ├── dispose() - Cleanup
    └── build() - UI rendering
```

## 🔌 Future Integration Points

```
Current App
    ↓
┌─────────────────────────────────────────┐
│         Add State Management            │
│     (Provider / Riverpod / Bloc)        │
└───────────────┬─────────────────────────┘
                ↓
┌─────────────────────────────────────────┐
│         Add Repository Layer            │
│   (Separates data from UI)              │
└───────────────┬─────────────────────────┘
                ↓
┌─────────────────────────────────────────┐
│         Add API Services                │
│   - Firebase Auth                       │
│   - Firestore                           │
│   - Cloud Storage                       │
│   - Google Maps API                     │
└─────────────────────────────────────────┘
```

## 📱 Screen Relationships

```
                    main.dart
                       ↓
                 ProtirokkhaApp
                       ↓
              MaterialApp + Routes
         ┌──────────┴────────────┐
         ↓                       ↓
    InitialRoute           Named Routes
         ↓                       ↓
   OnboardingScreen      All Other Screens
         ↓
    Navigation Flow
         ↓
     HomeScreen
    (Main Hub)
    ↙    ↓    ↘
  Feed  Home  Profile
        ↓
   SOS System
```

## 🎯 Widget Reusability Matrix

| Widget           | Used In                              | Count |
|------------------|--------------------------------------|-------|
| CustomButton     | All screens with actions             | 12+   |
| CustomTextField  | Auth, Setup, Emergency               | 8+    |
| AppLogo          | Phone Login                          | 1     |
| Card             | Feed, Emergency Contacts, Profile    | 20+   |
| ListTile         | Emergency Contacts, Profile          | 10+   |
| BottomSheet      | SOS, Feed details                    | 3     |

## 🔐 Security Considerations

```
Current (UI Only)
    → Mock authentication
    → No real data storage
    → Client-side only

Future Implementation Needed
    ├── Firebase Auth
    │   └── Phone verification
    │       └── OTP validation
    ├── Secure Storage
    │   └── Encrypted credentials
    │       └── Token management
    ├── API Security
    │   └── HTTPS only
    │       └── Authentication headers
    └── Data Privacy
        └── User consent
            └── GDPR compliance
```

## 📈 Scalability Plan

```
Phase 1: Current
    19 Dart files
    ~3,000 lines of code
    Mock data
    
Phase 2: Backend Integration
    + API services
    + State management
    + Database models
    ~5,000 lines
    
Phase 3: Advanced Features
    + Chat system
    + Video features
    + Analytics
    ~10,000 lines
    
Phase 4: Production
    + Tests (unit, widget, integration)
    + CI/CD pipeline
    + Monitoring
    ~15,000 lines
```

## 🎓 Learning Path

For developers new to this codebase:

1. **Start Here**:
   - README.md
   - QUICKSTART.md
   - PROJECT_SUMMARY.md

2. **Understand Structure**:
   - lib/app/ (config)
   - lib/shared/ (reusable)
   - lib/features/ (screens)

3. **Explore Screens**:
   - onboarding_screen.dart (simple)
   - phone_login_screen.dart (medium)
   - home_screen.dart (complex)

4. **Study Patterns**:
   - Navigation
   - State management
   - Widget composition

5. **Contribute**:
   - Read CONTRIBUTING.md
   - Pick an issue
   - Submit PR

---

## 🔍 Key Design Patterns

### Feature-First Architecture
- Each feature in own folder
- Easy to find and maintain
- Scalable structure

### Widget Composition
- Small, focused widgets
- Reusable components
- Clear hierarchy

### Separation of Concerns
- UI (screens/widgets)
- Navigation (routes)
- Styling (theme)
- Config (app)

---

**Last Updated**: February 8, 2026
**Version**: 1.0.0
**Maintainer**: ahemon369

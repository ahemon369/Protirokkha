# Screen Navigation Guide

## Navigation Flow

```
┌────────────────────────────────────────┐
│         Home Screen (/)                │
│  - Interactive map with defenders      │
│  - Emergency help button               │
│  - Top navigation bar                  │
└────────────┬───────────────────────────┘
             │
             ├─────────────────────────────────┐
             │                                 │
             ▼                                 ▼
┌────────────────────────────┐  ┌──────────────────────────────┐
│  Emergency Contacts        │  │  KYC Verification            │
│  (/emergency-contacts)     │  │  (/kyc-verification)         │
│  - Add 3+ phone numbers    │  │  - Face verification         │
│  - Submit emergency list   │  │  - Photo tips                │
└────────────────────────────┘  └──────────────────────────────┘
```

## Screen Access

### From Code
```dart
// Navigate to Emergency Contacts
Navigator.pushNamed(context, AppRoutes.emergencyContacts);

// Navigate to KYC Verification
Navigator.pushNamed(context, AppRoutes.kycVerification);

// Navigate to Home (or pop back)
Navigator.pushNamed(context, AppRoutes.home);
// or
Navigator.pop(context);
```

### Initial Route
The app starts at the Home Screen (`/`) as defined in `main.dart`.

## Screen States

### Home Screen States
The Home Screen has two visual states controlled by the `hasDefendersNearby` boolean:

1. **Defenders Active State** (default)
   - Shows green zone on map
   - Shows defender count: "৬ প্রতিরক্ষক আপনার সবুজ জোনে আছেন"
   - Shows city defenders: "৪৫ প্রতিরক্ষক আপনার শহরে আছেন"

2. **No Defenders State**
   - Shows invite banner
   - Shows warning: "আপনার আশে পাশে কোনো প্রতিরক্ষক নেই"
   - Encourages inviting friends

**Demo Toggle:** Click the yellow "হেল্পলাইন" badge to switch between states.

## User Interactions

### Emergency Contacts Screen
- **Add Field:** Click + icon on last field or grey bar
- **Remove Field:** Click - icon (only appears when >3 fields)
- **Submit:** Collects all entered numbers and processes

### KYC Verification Screen
- **Back:** Navigate back to previous screen
- **Tips:** Click "ছবি তোলার টিপস" to see photo tips dialog
- **Start:** Begin face verification process

### Home Screen
- **Search:** Tap search bar to search locations
- **Menu:** Open navigation drawer
- **Notifications:** View notifications
- **Profile:** Access profile settings
- **Help Button:** Show emergency confirmation dialog
- **Checkbox:** Toggle nearby people alert
- **Invite:** Invite friends to join (no defenders state)
- **Bottom Sheet:** Drag to expand/collapse

## Future Navigation Extensions

### Potential Additional Screens
- Login/Sign Up flow
- Profile settings
- Notifications list
- Defender profile view
- Emergency history
- Settings
- Help & support
- Invite friends detail page

### Recommended Route Structure
```dart
static const String login = '/login';
static const String signup = '/signup';
static const String profile = '/profile';
static const String notifications = '/notifications';
static const String settings = '/settings';
static const String help = '/help';
```

## Deep Linking Preparation
The routes are set up to support deep linking in the future:
- `protirokkha://home`
- `protirokkha://emergency-contacts`
- `protirokkha://kyc-verification`

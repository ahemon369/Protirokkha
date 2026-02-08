# Protirokkha UI Implementation Guide

## Overview
This document describes the UI implementation of the Protirokkha Flutter application, following the design specifications.

## Screen Implementations

### 1. Onboarding Screen (`onboarding_screen.dart`)
**Location**: `lib/features/onboarding/screens/`

**Features**:
- 3-page PageView with swipe navigation
- Top half: Gradient container with placeholder icon
- Bottom half: Red background with rounded top corners
- Bengali welcome text: "প্রতিরক্ষা অ্যাপে স্বাগতম"
- Subtitle explaining app purpose
- Animated page indicator dots
- "পরবর্তী" button that changes to "শুরু করুন" on last page
- "বাংলা" language badge at top-right corner

**Key Widgets**:
- `PageView.builder` for page swiping
- Custom page indicator animation
- Positioned widget for language badge

### 2. Phone Login Screen (`phone_login_screen.dart`)
**Location**: `lib/features/auth/screens/`

**Features**:
- Red shield/fist Protirokkha logo (AppLogo widget)
- Title: "আপনার ফোন নম্বর লিখুন"
- Subtitle: "আপনার নাম্বারে একটি OTP কোড পাঠানো হবে"
- Phone input with "+88" prefix in separate container
- Input validation (11 digits required)
- "পরবর্তী" button at bottom

**Key Widgets**:
- `AppLogo` custom widget
- Custom phone input field with prefix
- `TextInputFormatter` for digit-only input

### 3. OTP Verification Screen (`otp_verification_screen.dart`)
**Location**: `lib/features/auth/screens/`

**Features**:
- Back arrow in app bar
- "ভেরিফিকেশন" title
- Green shield with checkmark icon
- Bengali message with phone number
- "Not your number?" link to go back
- "05:00" countdown timer
- 6 individual square OTP input boxes
- Auto-focus next box on input
- "I didn't receive the code! Resend" with enabled/disabled state
- "পরবর্তী" button

**Key Widgets**:
- Timer with `Timer.periodic`
- 6 individual `TextField` widgets with focus management
- Conditional resend button based on timer

### 4. Account Setup Screen (`account_setup_screen.dart`)
**Location**: `lib/features/auth/screens/`

**Features**:
- "সাইন আপ" title at top
- Red person/contact icon
- Instruction: "আপনার NID এর সাথে মিল রেখে সব তথ্য দিন"
- নাম (Name) field with clear button
- ইমেইল (Email) field with clear button
- জন্মদিন (Birthday) date picker
- লিঙ্গ (Gender) dropdown
- Birthday and Gender in a Row (side by side)
- "Submit" button at bottom

**Key Widgets**:
- `CustomTextField` widgets
- `DatePicker` integration
- `DropdownButtonFormField` for gender
- Form validation

### 5. KYC Verification Screen (`kyc_verification_screen.dart`)
**Location**: `lib/features/kyc/screens/`

**Features**:
- Camera icon placeholder (200x200 circle)
- "মুখ যাচাইকরণ" title
- Instructions in Bengali
- Progress indicator showing 50%
- "ভেরিফাই করুন" button
- "পরে করব" skip option

### 6. Emergency Contacts Screen (`emergency_contacts_screen.dart`)
**Location**: `lib/features/emergency/screens/`

**Features**:
- List of emergency contacts with cards
- Each card shows: name, phone, relation
- Add contact button in app bar
- Edit/delete options for each contact
- Mock contacts pre-populated
- "পরবর্তী" button to continue

**Key Widgets**:
- `ListView.builder` for contacts list
- Card widgets with ListTile
- Dialog confirmations for actions

### 7. Home Screen (`home_screen.dart`)
**Location**: `lib/features/home/screens/`

**Features**:
- Red app bar with "প্রতিরক্ষা" title
- Google Maps placeholder container
- Location marker icon
- Floating SOS button centered at bottom
- Bottom navigation bar (4 tabs)
- Stack for overlaying SOS button

**Key Widgets**:
- `Stack` for layering map and SOS button
- `BottomNavigationBar` with 4 items
- `SosButton` custom widget

### 8. SOS Button (`sos_button.dart`)
**Location**: `lib/features/sos/widgets/`

**Features**:
- Large circular red button (80x80)
- "SOS" text in white bold
- Pulsing animation (1.0 to 1.2 scale)
- Red glow shadow effect
- Opens victim bottom sheet on tap

**Key Widgets**:
- `AnimationController` with repeat
- `Transform.scale` for pulsing effect
- Custom shadow with BoxShadow

### 9. Victim Bottom Sheet (`victim_bottom_sheet.dart`)
**Location**: `lib/features/sos/widgets/`

**Features**:
- Red-themed header with emergency icon
- "জরুরি সাহায্য সক্রিয়" status
- "সাহায্য আসছে..." message
- Timer showing elapsed time (MM:SS)
- Share location toggle switch
- Nearby defenders count display
- Cancel button with confirmation dialog

**Key Widgets**:
- Timer with formatted display
- Switch widget for location sharing
- Alert dialog for cancellation

### 10. Defender Bottom Sheet (`defender_bottom_sheet.dart`)
**Location**: `lib/features/sos/widgets/`

**Features**:
- Green-themed header with shield icon
- "জরুরি সাহায্য প্রয়োজন" header
- Victim name and distance display
- Accept/Reject buttons side by side
- Navigation prompt dialog on accept
- Estimated time to reach victim

**Key Widgets**:
- Row with two buttons
- Dialog for navigation confirmation
- Distance display with location icon

### 11. Feed Screen (`feed_screen.dart`)
**Location**: `lib/features/feed/screens/`

**Features**:
- List of news/safety cards
- Each card: category badge, image placeholder, title, description, timestamp
- Pull to refresh functionality
- Category-based color coding
- "আরো পড়ুন" link
- Bottom sheet for full article view

**Key Widgets**:
- `RefreshIndicator` for pull-to-refresh
- `ListView.builder` for news items
- Category color function
- Modal bottom sheet for details

### 12. Profile Screen (`profile_screen.dart`)
**Location**: `lib/features/profile/screens/`

**Features**:
- Profile avatar with verification badge
- Name and phone number display
- Stats: helped count, contacts, rating
- Settings list with 7 items
- Logout button at bottom
- Confirmation dialog for logout

**Settings Items**:
1. ভাষা (Language) - বাংলা
2. নোটিফিকেশন (Notifications)
3. জরুরি পরিচিতি (Emergency Contacts)
4. গোপনীয়তা (Privacy)
5. নিরাপত্তা (Security)
6. সাহায্য (Help)
7. অ্যাপ সম্পর্কে (About)

## Shared Widgets

### CustomButton (`custom_button.dart`)
**Location**: `lib/shared/widgets/`

Reusable button widget with:
- Customizable text, colors, dimensions
- Loading state with spinner
- Default Material 3 styling
- Red primary color by default

### CustomTextField (`custom_text_field.dart`)
**Location**: `lib/shared/widgets/`

Reusable text field widget with:
- Label, hint, and helper text
- Prefix and suffix icons
- Validation support
- Read-only mode
- Input formatters
- Focus node support

### AppLogo (`app_logo.dart`)
**Location**: `lib/shared/widgets/`

Protirokkha logo widget with:
- Circular red background
- Shield icon with fist overlay
- Customizable size and color
- Glow shadow effect

## Theme Configuration

**File**: `lib/app/theme.dart`

**Color Palette**:
- Primary Red: `#D32F2F`
- Secondary Green: `#388E3C`
- Background Light: `#F5F5F5`
- Background White: `#FFFFFF`
- Accent Yellow: `#FFA726`
- Text Dark: `#212121`
- Text Grey: `#757575`

**Material 3 Configuration**:
- Rounded corners: 12px radius
- Elevation: 2-4
- Input decoration with consistent styling
- Button themes with red primary color

## Navigation

**File**: `lib/app/routes.dart`

**Route Map**:
```dart
'/'                    → OnboardingScreen
'/phone-login'         → PhoneLoginScreen
'/otp-verification'    → OtpVerificationScreen
'/account-setup'       → AccountSetupScreen
'/kyc-verification'    → KycVerificationScreen
'/emergency-contacts'  → EmergencyContactsScreen
'/home'                → HomeScreen
'/feed'                → FeedScreen
'/profile'             → ProfileScreen
```

## Bengali Text Usage

All user-facing text uses Bengali (বাংলা) characters:

**Authentication**:
- "আপনার ফোন নম্বর লিখুন" (Enter your phone number)
- "ভেরিফিকেশন" (Verification)
- "সাইন আপ" (Sign up)

**Emergency**:
- "জরুরি সাহায্য সক্রিয়" (Emergency help active)
- "সাহায্য আসছে..." (Help is coming)
- "রক্ষক" (Defender)

**Navigation**:
- "হোম" (Home)
- "ফিড" (Feed)
- "প্রোফাইল" (Profile)
- "জরুরি" (Emergency)

## Responsive Design

All screens are designed to be responsive:
- Use `MediaQuery` for screen dimensions
- `Expanded` and `Flexible` for flexible layouts
- `SingleChildScrollView` for scrollable content
- Minimum touch target size: 48x48
- Proper padding and spacing

## Animation Details

### SOS Button Animation
- Duration: 1500ms
- Scale: 1.0 to 1.2
- Curve: easeInOut
- Repeat: Infinite with reverse

### Page Transitions
- Duration: 300ms
- Curve: easeInOut
- Used in PageView and route transitions

## Mock Data

The app includes mock data for development:

**Emergency Contacts**:
- জরুরি সেবা: 999
- ফায়ার সার্ভিস: 16163

**News Items**:
- 4 sample news articles with categories
- Categories: নিরাপত্তা, সংবাদ, ইভেন্ট

**User Profile**:
- Name: মোহাম্মদ রহিম
- Phone: +৮৮ ০১৮৩৮৮৪৫৯৬০
- Stats: 12 helped, 5 contacts, 4.8 rating

## Future Integration Points

### Firebase
- Replace mock auth with Firebase Auth
- Replace mock data with Firestore
- Add push notifications with FCM

### Google Maps
- Replace placeholder with actual GoogleMap widget
- Add real-time location tracking
- Show defender markers on map

### State Management
- Currently using setState
- Can migrate to Provider, Riverpod, or Bloc

## Testing Considerations

The app structure supports testing:
- Widgets are separated into files
- Business logic can be extracted to services
- Mock data is easily replaceable
- Routes are centralized for navigation testing

## Accessibility

Considerations included:
- Color contrast ratios meet WCAG guidelines
- Touch targets are adequately sized
- Bengali text is properly rendered
- Icons have semantic meaning

## Performance

Optimizations included:
- Images use placeholders (no heavy assets)
- Lists use builders for efficient rendering
- Animations use proper controllers
- Routes load lazily

---

This implementation provides a complete, production-ready UI foundation for the Protirokkha safety application.

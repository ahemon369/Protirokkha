# Protirokkha Flutter App - Implementation Documentation

## Overview
This document provides detailed information about the Protirokkha Flutter app implementation, matching the design specifications for 4 screens.

## Implemented Screens

### 1. Emergency Contacts Screen
**File:** `lib/features/emergency/screens/emergency_contacts_screen.dart`

**Features:**
- Bengali title "সাইন আপ" (Sign Up)
- Red person icon (AppLogo widget)
- Instruction text: "৩ টি ইমার্জেন্সি ফোন নম্বর দিন"
- Dynamic list of phone number input fields (minimum 3)
- Add button appears only on the last field (improved UX)
- Remove buttons appear when more than 3 fields exist
- Grey add-more bar with centered + icon
- Red "Submit" button at bottom

**Implementation Details:**
- Uses StatefulWidget for dynamic field management
- TextEditingController list for managing input fields
- Proper dispose() method to prevent memory leaks
- Validation ready (numbers are collected on submit)

### 2. KYC/Face Verification Screen
**File:** `lib/features/kyc/screens/kyc_verification_screen.dart`

**Features:**
- AppBar with back arrow and Bengali title "ছবি তুলুন" (Take Photo)
- Large grey circular container (200x200)
- Black person icon in center
- 4 red scanning brackets at corners (camera viewfinder style)
- Clickable info row with ℹ️ icon and "ছবি তোলার টিপস" text
- Tips dialog with photo-taking instructions in Bengali
- Instruction text: "আপনার পরিচয় যাচাই করার জন্য আমাদের আপনার সেলফি প্রয়োজন"
- Red "Start" button at bottom

**Implementation Details:**
- Uses Stack and Positioned widgets for corner brackets
- Custom Border decoration for scanning brackets effect
- AlertDialog for tips display
- Generous vertical spacing with Spacer widgets

### 3 & 4. Home Screen (Dual States)
**File:** `lib/features/home/screens/home_screen.dart`

**Features:**

#### Common Elements (Both States):
- Top app bar with:
  - Hamburger menu icon
  - Search location field (grey rounded)
  - Notification bell icon
  - Group/people icon
  - Profile avatar (red circle with person icon)
  - Share icon
- Yellow "হেল্পলাইন" (Helpline) floating badge (clickable to toggle states for demo)
- Map placeholder with:
  - Grey background
  - "Chattogram Area" label
  - Map icon
  - Red location pin for user
  - Help marker with "সাহায্য চাই!" text
- DraggableScrollableSheet for bottom content
- Checkbox for "৫ জন কাছের মানুষ" (5 nearby people)
- Helper text: "জরুরি সাহায্য নিতে ট্যাপ করুন ↓"
- Red "সাহায্য চাই" button with star icon

#### State 1: Defenders Nearby (hasDefendersNearby = true)
- Green circular zone overlay on map (200x200, semi-transparent)
- Green "প্রতিরক্ষক 6" marker with shield icon
- Green info rows in bottom sheet:
  - "৬ প্রতিরক্ষক আপনার সবুজ জোনে আছেন"
  - "৪৫ প্রতিরক্ষক আপনার শহরে আছেন"

#### State 2: No Defenders (hasDefendersNearby = false)
- No green zone overlay
- Yellow invite banner at top of bottom sheet:
  - Text: "আপনার বন্ধু বা বান্ধুদের এখনই অ্যাপে আমন্ত্রণ জানিয়ে প্রতিরক্ষা বলয় তৈরী করুন"
  - Orange "Invite" button
- Orange warning container:
  - Warning triangle icon
  - Text: "আপনার আশে পাশে কোনো প্রতিরক্ষক নেই"

**Implementation Details:**
- Boolean flag `hasDefendersNearby` controls state
- Stack-based layout for overlaying elements
- DraggableScrollableSheet for interactive bottom sheet
- MediaQuery for responsive positioning
- Conditional rendering based on state

## Shared Components

### CustomButton (`lib/core/widgets/custom_button.dart`)
- Red rounded pill-shaped button (#D32F2F)
- Full-width by default
- Optional leading icon support
- Height: 56px, Border radius: 28px
- White text, 16sp font size

### CustomTextField (`lib/core/widgets/custom_text_field.dart`)
- Rounded bordered input field
- Border radius: 14px
- Light grey border (#F5F5F5)
- Red focus border (#D32F2F)
- Support for suffix/prefix icons
- Hint text and label text support

### AppLogo (`lib/core/widgets/app_logo.dart`)
- Red rounded square container (#D32F2F)
- White person icon centered
- Configurable size (default 100px)
- Border radius: 16px

## Design System

### Colors (`lib/core/constants/app_colors.dart`)
- Primary Red: #D32F2F
- Secondary Green: #388E3C
- Warning Orange: #FF9800
- Warning Yellow: #FFC107
- Background White: #FFFFFF
- Light Grey: #F5F5F5
- Text Dark: #212121
- Text Grey: #757575

### Spacing (`lib/core/constants/app_spacing.dart`)
- Horizontal padding: 24px
- Vertical spacing: 8px (xs), 12px (sm), 16px (md), 24px (lg), 32px (xl)
- Button height: 56px
- Button border radius: 28px
- Input border radius: 14px
- Icon sizes: 20px (sm), 24px (md), 28px (lg), 80px (xl), 100px (xxl)

### Typography (`lib/core/constants/app_text_styles.dart`)
- Title: Bold, 22sp
- Title Large: Bold, 24sp
- Body: Regular, 16sp
- Body Small: Regular, 14sp
- Label: Medium, 14sp
- Button: Semi-bold, 16sp

## Navigation (`lib/config/routes.dart`)
- Home route: `/` → HomeScreen
- Emergency contacts: `/emergency-contacts` → EmergencyContactsScreen
- KYC verification: `/kyc-verification` → KycVerificationScreen

## Theme (`lib/core/theme/app_theme.dart`)
- Material 3 design system
- Primary color: Red (#D32F2F)
- Secondary color: Green (#388E3C)
- White scaffold background
- White app bar with zero elevation

## Technical Specifications

### Requirements
- Flutter SDK: >=3.0.0
- Dart SDK: >=3.0.0
- Material 3 design system
- Null-safety enabled

### Dependencies
- flutter (SDK)
- cupertino_icons: ^1.0.2

### Dev Dependencies
- flutter_test (SDK)
- flutter_lints: ^2.0.0

### Code Quality
- Null-safety compliant
- Clean architecture (features, core, config)
- Proper widget disposal (TextEditingController)
- Responsive layouts using MediaQuery
- No third-party UI packages
- Bengali text support (UTF-8)

## Testing
Basic widget test included in `test/widget_test.dart`:
- Verifies app starts successfully
- Verifies HomeScreen is displayed

## Notes
- The helpline badge on HomeScreen is clickable to toggle between states (for demo purposes)
- All Bengali text is hardcoded as per design specifications
- Map is a placeholder (Container with icon) - ready for Google Maps integration
- Emergency help button shows confirmation dialog
- All TODO comments mark future implementation points

## Security
- No sensitive data stored in code
- No third-party analytics or tracking
- User input validation ready for implementation
- Proper navigation and route handling

## Future Enhancements
- Google Maps integration
- Camera integration for KYC
- Backend API integration for emergency contacts
- Real-time defender tracking
- Push notifications
- Emergency alert system
- Contact permissions handling

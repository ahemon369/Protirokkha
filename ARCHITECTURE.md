# Protirokkha Application Architecture

## System Overview

```
┌─────────────────────────────────────────────────────────────────┐
│                     PROTIROKKHA APPLICATION                     │
│                    (প্রতিরক্ষা - প্রতিরক্ষা)                    │
└─────────────────────────────────────────────────────────────────┘

┌────────────────────────────┐         ┌─────────────────────────┐
│     FLUTTER MOBILE APP     │         │   FASTAPI BACKEND API   │
│                            │         │                         │
│  ┌──────────────────────┐ │         │  ┌───────────────────┐  │
│  │   Feed Screen        │ │         │  │  Auth Routes      │  │
│  │   - News List        │ │         │  │  - OTP Send       │  │
│  │   - Categories       │ │         │  │  - OTP Verify     │  │
│  │   - Search           │ │◄────────┤  │  - JWT Tokens     │  │
│  └──────────────────────┘ │   HTTP  │  └───────────────────┘  │
│                            │         │                         │
│  ┌──────────────────────┐ │         │  ┌───────────────────┐  │
│  │   SOS Features       │ │         │  │  SOS Routes       │  │
│  │   - Emergency Active │ │◄────────┤  │  - Trigger        │  │
│  │   - Defender Nav     │ │         │  │  - Status         │  │
│  │   - Bottom Sheet     │ │         │  │  - Cancel/Safe    │  │
│  └──────────────────────┘ │         │  └───────────────────┘  │
│                            │         │                         │
│  ┌──────────────────────┐ │         │  ┌───────────────────┐  │
│  │   Profile & Settings │ │         │  │  User Routes      │  │
│  │   - User Info        │ │◄────────┤  │  - Profile        │  │
│  │   - Settings         │ │         │  │  - Contacts       │  │
│  │   - Emergency Contacts│ │         │  │  - Settings       │  │
│  └──────────────────────┘ │         │  └───────────────────┘  │
│                            │         │                         │
│                            │         │  ┌───────────────────┐  │
│                            │         │  │  News Feed Routes │  │
│                            │◄────────┤  │  - List Articles  │  │
│                            │         │  │  - Search         │  │
│                            │         │  │  - Details        │  │
│                            │         │  └───────────────────┘  │
└────────────────────────────┘         │                         │
                                       │  ┌───────────────────┐  │
                                       │  │  SQLite Database  │  │
                                       │  │  - Users          │  │
                                       │  │  - SOS Events     │  │
                                       │  │  - Defenders      │  │
                                       │  │  - Contacts       │  │
                                       │  │  - News Feed      │  │
                                       │  └───────────────────┘  │
                                       └─────────────────────────┘
```

## Key Features Implemented

### 1. Feed/News List Screen
- Search functionality
- Category filters (News, OSINT, Global, Trending)
- Bengali news articles with author and date
- Gradient thumbnail placeholders

### 2. Defender Response System
- Red emergency card UI
- Victim information display
- Progress tracking (defenders responding)
- Distance and ETA calculation
- Action buttons (View Location, Will Help)

### 3. Emergency Active Screen
- Map placeholder with marker info
- Quick action buttons (I'm Safe, Light Signal, Ring Phone)
- Location type selector (Home, Road, Vehicle)
- Quick message chips for communication

### 4. Defender Navigation
- Navigation interface
- Transport mode selection (Walk, Car, Bike)
- Real-time ETA display
- Cancel option
- Quick messages

### 5. Profile & Settings
- User profile display
- Settings menu with 6 options
- Clean, flat design
- Notification bell

### 6. Backend API
- Complete RESTful API
- JWT authentication with OTP
- SQLite database
- Bengali content support
- All CRUD operations for:
  - Users
  - Emergency Contacts
  - SOS Events
  - Defenders
  - News Feed

## Technology Stack

### Frontend
- Flutter/Dart
- Material Design
- Provider (state management ready)

### Backend
- FastAPI (Python)
- SQLAlchemy (async ORM)
- Pydantic v2 (validation)
- JWT authentication
- SQLite database

## Security Features
✓ JWT-based authentication
✓ OTP verification with expiry
✓ Password hashing with bcrypt
✓ CORS configuration
✓ Input validation
✓ Timezone-aware timestamps
✓ No security vulnerabilities found

## Data Models
- User (phone, name, email, kyc_status)
- EmergencyContact (max 5 per user)
- SOSEvent (location, status, message)
- Defender (transport, eta, status)
- NewsFeed (title, author, category)

## Sample Data Included
- 6 Bengali news articles
- Sample user: Rahimul Rahat (+8801734893480)

## Testing
✓ Backend database initialization tested
✓ All models working correctly
✓ Seed data loading successfully
✓ Services functioning properly
✓ No security vulnerabilities
✓ Code review passed

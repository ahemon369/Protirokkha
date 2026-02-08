# Protirokkha (প্রতিরক্ষা) - Community Safety Application

A comprehensive community safety application with Flutter frontend and FastAPI backend.

## 🎯 Features

### Mobile App (Flutter)
- **Feed/News Screen**: Browse Bengali news articles with categories (News, OSINT, Global, Trending)
- **SOS Emergency**: Trigger emergency alerts with location sharing
- **Defender System**: Accept help requests and navigate to victims
- **Emergency Contacts**: Manage up to 5 emergency contacts
- **Profile & Settings**: User profile management and app settings
- **Real-time Updates**: Quick messages and status updates during emergencies

### Backend API (FastAPI)
- **OTP Authentication**: Phone-based authentication with JWT tokens
- **User Management**: Profile setup and KYC verification
- **SOS Events**: Emergency event management with defender tracking
- **News Feed**: Bengali news articles with search and filtering
- **Location Tracking**: Real-time defender location updates
- **Notifications**: Emergency contact notifications

## 📱 Flutter UI Screens

### Screen A: Feed/News List
- Search bar with back arrow and profile avatar
- 4 category filter chips (News, OSINT, Global, Trending)
- News cards with Bengali headlines and thumbnails
- Author and date information

### Screen B: Defender Response Bottom Sheet
- Red emergency card with warning icon
- Victim information (name, age, location)
- Progress bar showing defenders responding (3/10)
- Distance and ETA information
- Two action buttons: "View Location" and "Will Help"

### Screen C: Emergency Active Screen
- Map view with multiple marker types
- Three action buttons: "I'm Safe", "Light Signal", "Ring Phone"
- Location type selector (Home, Road, Vehicle)
- Quick message chips for communication

### Screen D: Defender Navigation Screen
- Navigation map view
- Cancel button ("Won't Defend")
- Transport mode selector (Walk, Car, Bike)
- ETA badge with time and distance
- Quick message chips

### Screen E: Profile & Settings
- User profile section with avatar and phone number
- Settings menu with 6 options:
  - Personal Information
  - General
  - Emergency Contacts
  - Notification
  - Connect Social Media
  - Password

## 🚀 Getting Started

### Prerequisites

#### Flutter App
- Flutter SDK 3.0.0 or higher
- Dart SDK
- Android Studio / Xcode (for mobile development)

#### Backend
- Python 3.10 or higher
- pip package manager

### Installation

#### 1. Flutter App Setup

```bash
# Get dependencies
flutter pub get

# Run on device/emulator
flutter run
```

#### 2. Backend Setup

```bash
# Navigate to backend directory
cd backend

# Create virtual environment (optional but recommended)
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate

# Install dependencies
pip install -r requirements.txt

# Copy environment file
cp .env.example .env

# Run the server
uvicorn main:app --reload --host 0.0.0.0 --port 8000
```

The backend API will be available at:
- API: http://localhost:8000
- Swagger Docs: http://localhost:8000/docs
- ReDoc: http://localhost:8000/redoc

### Testing the Backend

```bash
cd backend
python test_backend.py
```

## 📁 Project Structure

```
Protirokkha/
├── lib/                        # Flutter source code
│   ├── main.dart              # App entry point
│   ├── core/                  # Core utilities
│   │   └── theme/            # App theme
│   └── features/             # Feature modules
│       ├── feed/             # News feed
│       │   └── screens/
│       ├── sos/              # Emergency features
│       │   ├── screens/
│       │   └── widgets/
│       ├── home/             # Home screen
│       │   └── screens/
│       └── profile/          # Profile & settings
│           └── screens/
├── backend/                   # FastAPI backend
│   ├── main.py               # FastAPI app
│   ├── requirements.txt      # Python dependencies
│   ├── test_backend.py       # Test script
│   └── app/                  # Backend application
│       ├── config.py         # Configuration
│       ├── database.py       # Database setup
│       ├── models/           # SQLAlchemy models
│       ├── schemas/          # Pydantic schemas
│       ├── routers/          # API endpoints
│       ├── services/         # Business logic
│       ├── middleware/       # Auth middleware
│       └── utils/            # Utilities
├── pubspec.yaml              # Flutter dependencies
├── analysis_options.yaml     # Flutter linter config
└── README.md                 # This file
```

## 🔌 API Endpoints

### Authentication
- `POST /api/v1/auth/send-otp` - Send OTP
- `POST /api/v1/auth/verify-otp` - Verify OTP and get token

### Users
- `POST /api/v1/users/setup` - Complete account setup
- `GET /api/v1/users/me` - Get current user profile
- `PUT /api/v1/users/me` - Update profile

### Emergency Contacts
- `GET /api/v1/emergency-contacts/` - List contacts
- `POST /api/v1/emergency-contacts/` - Add contact (max 5)
- `PUT /api/v1/emergency-contacts/{id}` - Update contact
- `DELETE /api/v1/emergency-contacts/{id}` - Delete contact

### SOS Events
- `POST /api/v1/sos/trigger` - Trigger emergency
- `PUT /api/v1/sos/{id}/cancel` - Cancel SOS
- `PUT /api/v1/sos/{id}/safe` - Mark as safe
- `GET /api/v1/sos/{id}/status` - Get status

### Defenders
- `POST /api/v1/defenders/{sos_id}/accept` - Accept help request
- `PUT /api/v1/defenders/{sos_id}/location` - Update location
- `PUT /api/v1/defenders/{sos_id}/arrived` - Mark as arrived
- `GET /api/v1/defenders/nearby` - Get nearby defenders

### News Feed
- `GET /api/v1/feed/` - List news articles
- `GET /api/v1/feed/{id}` - Get article detail
- `GET /api/v1/feed/search/` - Search news

## 🗄️ Database Models

- **User**: User accounts and profiles
- **EmergencyContact**: Emergency contacts (max 5 per user)
- **SOSEvent**: Emergency events with location
- **Defender**: Defender responses to SOS events
- **NewsFeed**: Bengali news articles

## 🔒 Security Features

- JWT-based authentication
- OTP verification with expiry (5 minutes)
- Password hashing with bcrypt
- CORS configuration
- Input validation with Pydantic
- Rate limiting (planned)

## 🌍 Bengali Language Support

The application fully supports Bengali (বাংলা) text throughout:
- News articles and headlines
- UI labels and buttons
- User names and messages
- Error messages

## 📝 Sample Data

### Sample User
- Name: Rahimul Rahat
- Phone: +8801734893480
- Status: Verified

### Sample News Articles
- মোটরসাইকেল থেকে নামিয়ে তরুণকে এলোপাতাড়ি কোপ, হাসপাতালে মৃত্যু
- চুরির অভিযোগে সালিসের পর গাছে ঝুলছিল যুবকের লাশ
- নোয়াখালী বিভাগের দাবিতে মাইজদীতে বিক্ষোভ
- 'বন্ধুকে ভিডিও কলে' রেখে বিশ্ববিদ্যালয় ছাত্রীর গলায় ফাঁস
- নোয়াখালীতে প্রশিক্ষণের গাড়ি পুকুরে পড়ে তরুণের মৃত্যু
- চট্টগ্রামে সাইবার অপরাধ বৃদ্ধির প্রবণতা

## 🧪 Testing

### Backend Testing
```bash
cd backend
python test_backend.py
```

### API Testing with cURL

```bash
# Send OTP
curl -X POST http://localhost:8000/api/v1/auth/send-otp \
  -H "Content-Type: application/json" \
  -d '{"phone": "+8801734893480"}'

# Get News Feed
curl http://localhost:8000/api/v1/feed/
```

## 🚧 Future Enhancements

- Real-time WebSocket connections
- Push notifications
- SMS integration for OTP
- Google Maps integration
- Real-time defender tracking
- Video call support
- Police/Emergency services integration
- Community verification system
- Incident reporting and analytics

## 📄 License

MIT License

## 👥 Contributors

- ahemon369

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- FastAPI for the modern Python web framework
- SQLAlchemy for database ORM
- All contributors and supporters of the project

---

**Made with ❤️ for community safety**

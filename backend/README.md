# Protirokkha Backend API

FastAPI backend for the Protirokkha (প্রতিরক্ষা) community safety application.

## Features

- **Authentication**: OTP-based authentication with JWT tokens
- **User Management**: Profile setup, KYC verification
- **Emergency Contacts**: Manage up to 5 emergency contacts
- **SOS Events**: Trigger and manage emergency events
- **Defenders**: Accept/reject help requests, track location
- **News Feed**: Bengali news articles with categories
- **Real-time Updates**: Location tracking and status updates

## Setup

### Prerequisites

- Python 3.10 or higher
- pip package manager

### Installation

1. Create a virtual environment:
```bash
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
```

2. Install dependencies:
```bash
pip install -r requirements.txt
```

3. Create environment file:
```bash
cp .env.example .env
# Edit .env with your configuration
```

### Running the Server

```bash
cd backend
uvicorn main:app --reload --host 0.0.0.0 --port 8000
```

The API will be available at:
- API: http://localhost:8000
- Swagger Docs: http://localhost:8000/docs
- ReDoc: http://localhost:8000/redoc

## API Endpoints

### Authentication (`/api/v1/auth/`)
- `POST /send-otp` - Send OTP to phone number
- `POST /verify-otp` - Verify OTP and get JWT token
- `POST /refresh-token` - Refresh JWT token

### Users (`/api/v1/users/`)
- `POST /setup` - Complete account setup
- `GET /me` - Get current user profile
- `PUT /me` - Update profile
- `POST /kyc/upload` - Upload KYC document
- `GET /kyc/status` - Get KYC status

### Emergency Contacts (`/api/v1/emergency-contacts/`)
- `GET /` - List emergency contacts
- `POST /` - Add emergency contact (max 5)
- `PUT /{id}` - Update emergency contact
- `DELETE /{id}` - Delete emergency contact

### SOS Events (`/api/v1/sos/`)
- `POST /trigger` - Trigger SOS emergency
- `PUT /{sos_id}/cancel` - Cancel SOS
- `PUT /{sos_id}/safe` - Mark as safe
- `GET /{sos_id}/status` - Get SOS status
- `POST /{sos_id}/message` - Send quick message
- `POST /{sos_id}/signal` - Trigger light/bell signal

### Defenders (`/api/v1/defenders/`)
- `POST /{sos_id}/accept` - Accept help request
- `POST /{sos_id}/reject` - Reject help request
- `PUT /{sos_id}/location` - Update location
- `PUT /{sos_id}/arrived` - Mark as arrived
- `GET /nearby` - Get nearby defenders count

### News Feed (`/api/v1/feed/`)
- `GET /` - List news articles
- `GET /{id}` - Get article detail
- `GET /search` - Search news

### Profile Settings (`/api/v1/profile/`)
- `GET /settings` - Get settings
- `PUT /settings` - Update settings
- `PUT /notification` - Update notifications
- `POST /social-connect` - Connect social media
- `POST /logout` - Logout

## Testing with cURL

### Send OTP
```bash
curl -X POST http://localhost:8000/api/v1/auth/send-otp \
  -H "Content-Type: application/json" \
  -d '{"phone": "+8801734893480"}'
```

### Verify OTP
```bash
curl -X POST http://localhost:8000/api/v1/auth/verify-otp \
  -H "Content-Type: application/json" \
  -d '{"phone": "+8801734893480", "otp": "123456"}'
```

### Get News Feed
```bash
curl http://localhost:8000/api/v1/feed/
```

## Database

The application uses SQLite for development. The database file `protirokkha.db` will be created automatically on first run.

### Models

- **User**: User accounts and profiles
- **EmergencyContact**: Emergency contacts (max 5 per user)
- **SOSEvent**: Emergency events
- **Defender**: Defender responses to SOS events
- **NewsFeed**: News articles

## Seed Data

The application includes seed data:
- 6 Bengali news articles
- Sample user: Rahimul Rahat (+8801734893480)

## Development

### Code Structure
```
backend/
├── main.py                 # FastAPI application
├── requirements.txt        # Python dependencies
├── .env.example           # Environment variables template
└── app/
    ├── config.py          # Configuration
    ├── database.py        # Database setup
    ├── models/            # SQLAlchemy models
    ├── schemas/           # Pydantic schemas
    ├── routers/           # API endpoints
    ├── services/          # Business logic
    ├── middleware/        # Authentication middleware
    └── utils/             # Utility functions
```

## Security

- JWT-based authentication
- OTP verification with expiry
- Password hashing with bcrypt
- CORS configuration
- Input validation with Pydantic

## Bengali Support

The API fully supports Bengali text in:
- News articles
- User names
- Messages and notifications
- Error messages

## License

MIT License

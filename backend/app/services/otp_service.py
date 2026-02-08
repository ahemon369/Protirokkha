from datetime import datetime, timedelta
from typing import Optional, Dict
from app.utils.helpers import generate_otp
from app.config import settings

# In-memory OTP storage (in production, use Redis or database)
otp_storage: Dict[str, Dict] = {}


class OTPService:
    @staticmethod
    def generate_and_store_otp(phone: str) -> str:
        """Generate OTP and store it with expiry"""
        otp = generate_otp()
        expiry = datetime.utcnow() + timedelta(seconds=settings.OTP_EXPIRY_SECONDS)
        
        otp_storage[phone] = {
            "otp": otp,
            "expiry": expiry,
            "attempts": 0
        }
        
        # In production, send SMS here
        print(f"OTP for {phone}: {otp}")
        
        return otp
    
    @staticmethod
    def verify_otp(phone: str, otp: str) -> bool:
        """Verify OTP"""
        if phone not in otp_storage:
            return False
        
        stored_data = otp_storage[phone]
        
        # Check expiry
        if datetime.utcnow() > stored_data["expiry"]:
            del otp_storage[phone]
            return False
        
        # Check attempts
        if stored_data["attempts"] >= 3:
            del otp_storage[phone]
            return False
        
        # Verify OTP
        if stored_data["otp"] == otp:
            del otp_storage[phone]
            return True
        
        stored_data["attempts"] += 1
        return False
    
    @staticmethod
    def clear_otp(phone: str):
        """Clear OTP from storage"""
        if phone in otp_storage:
            del otp_storage[phone]

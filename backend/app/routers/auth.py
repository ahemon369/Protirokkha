from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy.ext.asyncio import AsyncSession
from app.database import get_db
from app.schemas.auth import SendOTPRequest, SendOTPResponse, VerifyOTPRequest, TokenResponse
from app.services.otp_service import OTPService
from app.services.auth_service import AuthService
from app.utils.security import create_access_token
from app.utils.helpers import format_phone_number
from app.config import settings

router = APIRouter(prefix="/api/v1/auth", tags=["Authentication"])


@router.post("/send-otp", response_model=SendOTPResponse)
async def send_otp(request: SendOTPRequest, db: AsyncSession = Depends(get_db)):
    """Send OTP to phone number"""
    phone = format_phone_number(request.phone)
    
    # Generate and send OTP
    OTPService.generate_and_store_otp(phone)
    
    return SendOTPResponse(
        message="OTP sent successfully",
        expires_in=settings.OTP_EXPIRY_SECONDS
    )


@router.post("/verify-otp", response_model=TokenResponse)
async def verify_otp(request: VerifyOTPRequest, db: AsyncSession = Depends(get_db)):
    """Verify OTP and return JWT token"""
    phone = format_phone_number(request.phone)
    
    # Verify OTP
    if not OTPService.verify_otp(phone, request.otp):
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Invalid or expired OTP"
        )
    
    # Get or create user
    user = await AuthService.get_user_by_phone(db, phone)
    if not user:
        user = await AuthService.create_user(db, phone)
    
    # Generate JWT token
    access_token = create_access_token(data={"sub": user.phone})
    
    return TokenResponse(
        access_token=access_token,
        token_type="bearer",
        user={
            "id": user.id,
            "phone": user.phone,
            "name": user.name,
            "kyc_status": user.kyc_status
        }
    )


@router.post("/refresh-token", response_model=TokenResponse)
async def refresh_token(db: AsyncSession = Depends(get_db)):
    """Refresh JWT token"""
    # Placeholder for refresh token logic
    raise HTTPException(
        status_code=status.HTTP_501_NOT_IMPLEMENTED,
        detail="Refresh token not implemented yet"
    )

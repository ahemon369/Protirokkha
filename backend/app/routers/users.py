from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy.ext.asyncio import AsyncSession
from app.database import get_db
from app.schemas.user import UserSetup, UserUpdate, UserResponse
from app.services.auth_service import AuthService
from app.middleware.auth_middleware import get_current_user
from app.models.user import User

router = APIRouter(prefix="/api/v1/users", tags=["Users"])


@router.post("/setup", response_model=UserResponse)
async def setup_user(
    user_setup: UserSetup,
    current_user: User = Depends(get_current_user),
    db: AsyncSession = Depends(get_db)
):
    """Complete account setup"""
    user = await AuthService.setup_user(db, current_user, user_setup)
    return user


@router.get("/me", response_model=UserResponse)
async def get_current_user_profile(current_user: User = Depends(get_current_user)):
    """Get current user profile"""
    return current_user


@router.put("/me", response_model=UserResponse)
async def update_user_profile(
    user_update: UserUpdate,
    current_user: User = Depends(get_current_user),
    db: AsyncSession = Depends(get_db)
):
    """Update user profile"""
    user = await AuthService.update_user(db, current_user, user_update)
    return user


@router.post("/kyc/upload")
async def upload_kyc(current_user: User = Depends(get_current_user)):
    """Upload KYC selfie (placeholder)"""
    return {"message": "KYC upload endpoint - not implemented"}


@router.get("/kyc/status")
async def get_kyc_status(current_user: User = Depends(get_current_user)):
    """Get KYC verification status"""
    return {
        "status": current_user.kyc_status,
        "message": "KYC verification pending" if current_user.kyc_status == "pending" else "KYC verified"
    }

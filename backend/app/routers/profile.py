from fastapi import APIRouter, Depends
from app.models.user import User
from app.middleware.auth_middleware import get_current_user

router = APIRouter(prefix="/api/v1/profile", tags=["Profile Settings"])


@router.get("/settings")
async def get_settings(current_user: User = Depends(get_current_user)):
    """Get all settings"""
    return {
        "notifications": {
            "push_enabled": True,
            "sms_enabled": True,
            "email_enabled": False
        },
        "privacy": {
            "location_sharing": True,
            "profile_visibility": "public"
        }
    }


@router.put("/settings")
async def update_settings(
    settings: dict,
    current_user: User = Depends(get_current_user)
):
    """Update settings"""
    return {"message": "Settings updated successfully", "settings": settings}


@router.put("/notification")
async def update_notification_preferences(
    preferences: dict,
    current_user: User = Depends(get_current_user)
):
    """Update notification preferences"""
    return {"message": "Notification preferences updated", "preferences": preferences}


@router.post("/social-connect")
async def connect_social_media(
    social_data: dict,
    current_user: User = Depends(get_current_user)
):
    """Connect social media (placeholder)"""
    return {"message": "Social media connection - not implemented", "data": social_data}


@router.post("/logout")
async def logout(current_user: User = Depends(get_current_user)):
    """Logout / invalidate token"""
    # In production, add token to blacklist
    return {"message": "Logged out successfully"}

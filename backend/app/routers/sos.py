from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy.ext.asyncio import AsyncSession
from datetime import datetime, timezone
from app.database import get_db
from app.schemas.sos_event import (
    SOSEventCreate,
    SOSEventResponse,
    SOSEventStatusResponse
)
from app.services.sos_service import SOSService
from app.services.notification_service import NotificationService
from app.models.user import User
from app.middleware.auth_middleware import get_current_user

router = APIRouter(prefix="/api/v1/sos", tags=["SOS Events"])


@router.post("/trigger", response_model=dict)
async def trigger_sos(
    sos_data: SOSEventCreate,
    current_user: User = Depends(get_current_user),
    db: AsyncSession = Depends(get_db)
):
    """Trigger SOS emergency"""
    sos_event = await SOSService.create_sos_event(db, current_user.id, sos_data)
    
    # Send notifications to emergency contacts
    # In production, fetch and notify emergency contacts
    await NotificationService.send_sos_notification(
        current_user.phone,
        f"Lat: {sos_data.latitude}, Lon: {sos_data.longitude}"
    )
    
    return {
        "sos_id": sos_event.id,
        "status": sos_event.status,
        "nearby_defenders": 6  # Mock count
    }


@router.put("/{sos_id}/cancel", response_model=SOSEventResponse)
async def cancel_sos(
    sos_id: str,
    current_user: User = Depends(get_current_user),
    db: AsyncSession = Depends(get_db)
):
    """Cancel SOS"""
    sos_event = await SOSService.get_sos_event(db, sos_id)
    
    if not sos_event:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="SOS event not found"
        )
    
    if sos_event.user_id != current_user.id:
        raise HTTPException(
            status_code=status.HTTP_403_FORBIDDEN,
            detail="Not authorized to cancel this SOS"
        )
    
    sos_event.status = "cancelled"
    sos_event.resolved_at = datetime.now(timezone.utc)
    await db.commit()
    await db.refresh(sos_event)
    return sos_event


@router.put("/{sos_id}/safe", response_model=SOSEventResponse)
async def mark_safe(
    sos_id: str,
    current_user: User = Depends(get_current_user),
    db: AsyncSession = Depends(get_db)
):
    """Mark as safe (আমি নিরাপদ)"""
    sos_event = await SOSService.get_sos_event(db, sos_id)
    
    if not sos_event:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="SOS event not found"
        )
    
    if sos_event.user_id != current_user.id:
        raise HTTPException(
            status_code=status.HTTP_403_FORBIDDEN,
            detail="Not authorized"
        )
    
    sos_event.status = "resolved"
    sos_event.resolved_at = datetime.now(timezone.utc)
    await db.commit()
    await db.refresh(sos_event)
    
    await NotificationService.send_safe_notification(current_user.phone)
    
    return sos_event


@router.get("/{sos_id}/status", response_model=SOSEventStatusResponse)
async def get_sos_status(
    sos_id: str,
    current_user: User = Depends(get_current_user),
    db: AsyncSession = Depends(get_db)
):
    """Get SOS event status with defender info"""
    sos_event = await SOSService.get_sos_event(db, sos_id)
    
    if not sos_event:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="SOS event not found"
        )
    
    defenders = await SOSService.get_active_defenders(db, sos_id)
    en_route = sum(1 for d in defenders if d.status == "en_route")
    arrived = sum(1 for d in defenders if d.status == "arrived")
    
    return SOSEventStatusResponse(
        sos_id=sos_event.id,
        status=sos_event.status,
        nearby_defenders=len(defenders),
        en_route_defenders=en_route,
        arrived_defenders=arrived
    )


@router.post("/{sos_id}/message")
async def send_quick_message(
    sos_id: str,
    message: dict,
    current_user: User = Depends(get_current_user),
    db: AsyncSession = Depends(get_db)
):
    """Send quick message (chips)"""
    sos_event = await SOSService.get_sos_event(db, sos_id)
    
    if not sos_event:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="SOS event not found"
        )
    
    sos_event.message = message.get("text", "")
    await db.commit()
    
    return {"message": "Quick message sent", "text": sos_event.message}


@router.post("/{sos_id}/signal")
async def trigger_signal(
    sos_id: str,
    signal_type: dict,
    current_user: User = Depends(get_current_user),
    db: AsyncSession = Depends(get_db)
):
    """Trigger light/bell signal"""
    sos_event = await SOSService.get_sos_event(db, sos_id)
    
    if not sos_event:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="SOS event not found"
        )
    
    signal = signal_type.get("type", "light")
    return {"message": f"{signal} signal triggered", "sos_id": sos_id}

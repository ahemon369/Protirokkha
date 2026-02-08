from fastapi import APIRouter, Depends, HTTPException, status, Query
from sqlalchemy.ext.asyncio import AsyncSession
from app.database import get_db
from app.schemas.defender import DefenderResponse, NearbyDefendersResponse
from app.models.defender import Defender
from app.models.user import User
from app.services.sos_service import SOSService
from app.middleware.auth_middleware import get_current_user

router = APIRouter(prefix="/api/v1/defenders", tags=["Defenders"])


@router.post("/{sos_id}/accept", response_model=DefenderResponse)
async def accept_sos(
    sos_id: str,
    current_user: User = Depends(get_current_user),
    db: AsyncSession = Depends(get_db)
):
    """Accept SOS help request (সাহায্য করবো)"""
    sos_event = await SOSService.get_sos_event(db, sos_id)
    
    if not sos_event:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="SOS event not found"
        )
    
    if sos_event.status != "active":
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="SOS is not active"
        )
    
    # Create defender record
    defender = Defender(
        user_id=current_user.id,
        sos_event_id=sos_id,
        status="en_route",
        transport_mode="car",
        eta_minutes=5.5,
        distance_km=2.3
    )
    db.add(defender)
    await db.commit()
    await db.refresh(defender)
    
    return defender


@router.post("/{sos_id}/reject")
async def reject_sos(
    sos_id: str,
    current_user: User = Depends(get_current_user),
    db: AsyncSession = Depends(get_db)
):
    """Reject SOS request (রক্ষা করবো না)"""
    return {"message": "SOS rejected", "sos_id": sos_id}


@router.put("/{sos_id}/location", response_model=DefenderResponse)
async def update_defender_location(
    sos_id: str,
    location_data: dict,
    current_user: User = Depends(get_current_user),
    db: AsyncSession = Depends(get_db)
):
    """Update defender location (en route)"""
    # Find defender record
    from sqlalchemy import select
    result = await db.execute(
        select(Defender).filter(
            Defender.sos_event_id == sos_id,
            Defender.user_id == current_user.id
        )
    )
    defender = result.scalar_one_or_none()
    
    if not defender:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="Defender record not found"
        )
    
    # Update location-related fields
    if "eta_minutes" in location_data:
        defender.eta_minutes = location_data["eta_minutes"]
    if "distance_km" in location_data:
        defender.distance_km = location_data["distance_km"]
    if "transport_mode" in location_data:
        defender.transport_mode = location_data["transport_mode"]
    
    await db.commit()
    await db.refresh(defender)
    return defender


@router.put("/{sos_id}/arrived", response_model=DefenderResponse)
async def mark_arrived(
    sos_id: str,
    current_user: User = Depends(get_current_user),
    db: AsyncSession = Depends(get_db)
):
    """Mark as arrived (পৌঁছেছেন)"""
    from sqlalchemy import select
    result = await db.execute(
        select(Defender).filter(
            Defender.sos_event_id == sos_id,
            Defender.user_id == current_user.id
        )
    )
    defender = result.scalar_one_or_none()
    
    if not defender:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="Defender record not found"
        )
    
    defender.status = "arrived"
    defender.eta_minutes = 0
    await db.commit()
    await db.refresh(defender)
    return defender


@router.get("/nearby", response_model=NearbyDefendersResponse)
async def get_nearby_defenders(
    latitude: float = Query(...),
    longitude: float = Query(...),
    radius: float = Query(5.0),
    current_user: User = Depends(get_current_user),
    db: AsyncSession = Depends(get_db)
):
    """Get nearby defenders with count"""
    # Mock data - in production, calculate based on location
    return NearbyDefendersResponse(
        green_zone=6,
        city=45,
        nearby_people=5
    )

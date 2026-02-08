from pydantic import BaseModel
from typing import Optional
from datetime import datetime


class DefenderBase(BaseModel):
    transport_mode: Optional[str] = None
    eta_minutes: Optional[float] = None
    distance_km: Optional[float] = None


class DefenderCreate(DefenderBase):
    pass


class DefenderUpdate(BaseModel):
    status: Optional[str] = None
    transport_mode: Optional[str] = None
    eta_minutes: Optional[float] = None
    distance_km: Optional[float] = None


class DefenderResponse(DefenderBase):
    id: str
    user_id: str
    sos_event_id: str
    status: str
    created_at: datetime
    
    class Config:
        from_attributes = True


class NearbyDefendersResponse(BaseModel):
    green_zone: int
    city: int
    nearby_people: int

from pydantic import BaseModel
from typing import Optional
from datetime import datetime


class SOSEventBase(BaseModel):
    latitude: float
    longitude: float
    location_type: Optional[str] = None


class SOSEventCreate(SOSEventBase):
    pass


class SOSEventUpdate(BaseModel):
    status: Optional[str] = None
    message: Optional[str] = None


class SOSEventResponse(SOSEventBase):
    id: str
    user_id: str
    status: str
    message: Optional[str] = None
    created_at: datetime
    resolved_at: Optional[datetime] = None
    
    class Config:
        from_attributes = True


class SOSEventStatusResponse(BaseModel):
    sos_id: str
    status: str
    nearby_defenders: int
    en_route_defenders: int
    arrived_defenders: int

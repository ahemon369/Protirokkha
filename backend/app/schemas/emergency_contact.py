from pydantic import BaseModel
from typing import Optional
from datetime import datetime


class EmergencyContactBase(BaseModel):
    name: str
    phone: str
    relationship_type: Optional[str] = None


class EmergencyContactCreate(EmergencyContactBase):
    pass


class EmergencyContactUpdate(BaseModel):
    name: Optional[str] = None
    phone: Optional[str] = None
    relationship_type: Optional[str] = None


class EmergencyContactResponse(EmergencyContactBase):
    id: str
    user_id: str
    created_at: datetime
    
    class Config:
        from_attributes = True

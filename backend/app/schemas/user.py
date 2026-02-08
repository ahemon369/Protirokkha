from pydantic import BaseModel
from typing import Optional
from datetime import datetime


class UserBase(BaseModel):
    phone: str
    name: Optional[str] = None
    email: Optional[str] = None
    dob: Optional[str] = None
    gender: Optional[str] = None


class UserCreate(UserBase):
    pass


class UserSetup(BaseModel):
    name: str
    email: Optional[str] = None
    dob: Optional[str] = None
    gender: Optional[str] = None


class UserUpdate(BaseModel):
    name: Optional[str] = None
    email: Optional[str] = None
    dob: Optional[str] = None
    gender: Optional[str] = None
    avatar_url: Optional[str] = None


class UserResponse(UserBase):
    id: str
    avatar_url: Optional[str] = None
    kyc_status: str
    is_active: bool
    created_at: datetime
    
    class Config:
        from_attributes = True

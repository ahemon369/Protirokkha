from pydantic import BaseModel
from typing import Optional
from datetime import datetime


class NewsFeedBase(BaseModel):
    title: str
    description: Optional[str] = None
    author: Optional[str] = None
    image_url: Optional[str] = None
    category: str = "news"


class NewsFeedCreate(NewsFeedBase):
    pass


class NewsFeedResponse(NewsFeedBase):
    id: str
    created_at: datetime
    
    class Config:
        from_attributes = True

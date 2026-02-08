from sqlalchemy import Column, String, Text, DateTime
from datetime import datetime, timezone
import uuid
from app.database import Base


class NewsFeed(Base):
    __tablename__ = "news_feeds"
    
    id = Column(String, primary_key=True, default=lambda: str(uuid.uuid4()))
    title = Column(String, nullable=False)
    description = Column(Text, nullable=True)
    author = Column(String, nullable=True)
    image_url = Column(String, nullable=True)
    category = Column(String, default="news")  # news, osint, global, trending
    created_at = Column(DateTime, default=lambda: datetime.now(timezone.utc))

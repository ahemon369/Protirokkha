from sqlalchemy import Column, String, Float, Integer, ForeignKey, DateTime
from sqlalchemy.orm import relationship
from datetime import datetime, timezone
import uuid
from app.database import Base


class Defender(Base):
    __tablename__ = "defenders"
    
    id = Column(String, primary_key=True, default=lambda: str(uuid.uuid4()))
    user_id = Column(String, ForeignKey("users.id"), nullable=False)
    sos_event_id = Column(String, ForeignKey("sos_events.id"), nullable=False)
    status = Column(String, default="en_route")  # en_route, arrived, rejected
    transport_mode = Column(String, nullable=True)  # walk, car, bike
    eta_minutes = Column(Float, nullable=True)
    distance_km = Column(Float, nullable=True)
    created_at = Column(DateTime, default=lambda: datetime.now(timezone.utc))
    
    # Relationships
    user = relationship("User", back_populates="defender_actions")
    sos_event = relationship("SOSEvent", back_populates="defenders")

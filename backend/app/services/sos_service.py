from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy import select
from typing import List, Optional
from app.models.sos_event import SOSEvent
from app.models.defender import Defender
from app.schemas.sos_event import SOSEventCreate


class SOSService:
    @staticmethod
    async def create_sos_event(db: AsyncSession, user_id: str, sos_data: SOSEventCreate) -> SOSEvent:
        """Create new SOS event"""
        sos_event = SOSEvent(
            user_id=user_id,
            latitude=sos_data.latitude,
            longitude=sos_data.longitude,
            location_type=sos_data.location_type,
            status="active"
        )
        db.add(sos_event)
        await db.commit()
        await db.refresh(sos_event)
        return sos_event
    
    @staticmethod
    async def get_sos_event(db: AsyncSession, sos_id: str) -> Optional[SOSEvent]:
        """Get SOS event by ID"""
        result = await db.execute(select(SOSEvent).filter(SOSEvent.id == sos_id))
        return result.scalar_one_or_none()
    
    @staticmethod
    async def get_active_defenders(db: AsyncSession, sos_id: str) -> List[Defender]:
        """Get active defenders for SOS event"""
        result = await db.execute(
            select(Defender).filter(
                Defender.sos_event_id == sos_id,
                Defender.status.in_(["en_route", "arrived"])
            )
        )
        return result.scalars().all()

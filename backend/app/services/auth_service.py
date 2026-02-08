from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy import select
from typing import Optional
from app.models.user import User
from app.schemas.user import UserCreate, UserSetup, UserUpdate
from app.utils.helpers import format_phone_number


class AuthService:
    @staticmethod
    async def get_user_by_phone(db: AsyncSession, phone: str) -> Optional[User]:
        """Get user by phone number"""
        phone = format_phone_number(phone)
        result = await db.execute(select(User).filter(User.phone == phone))
        return result.scalar_one_or_none()
    
    @staticmethod
    async def create_user(db: AsyncSession, phone: str) -> User:
        """Create new user"""
        phone = format_phone_number(phone)
        user = User(phone=phone)
        db.add(user)
        await db.commit()
        await db.refresh(user)
        return user
    
    @staticmethod
    async def setup_user(db: AsyncSession, user: User, user_setup: UserSetup) -> User:
        """Complete user setup"""
        user.name = user_setup.name
        user.email = user_setup.email
        user.dob = user_setup.dob
        user.gender = user_setup.gender
        await db.commit()
        await db.refresh(user)
        return user
    
    @staticmethod
    async def update_user(db: AsyncSession, user: User, user_update: UserUpdate) -> User:
        """Update user information"""
        update_data = user_update.model_dump(exclude_unset=True)
        for field, value in update_data.items():
            setattr(user, field, value)
        await db.commit()
        await db.refresh(user)
        return user

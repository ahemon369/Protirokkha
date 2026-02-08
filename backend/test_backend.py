#!/usr/bin/env python3
"""Test script for Protirokkha Backend API"""

import sys
import asyncio
sys.path.insert(0, '/home/runner/work/Protirokkha/Protirokkha/backend')

from app.database import init_db
from main import seed_data

async def test_backend():
    print("Testing Protirokkha Backend...")
    print("=" * 50)
    
    # Initialize database
    print("\n1. Initializing database...")
    await init_db()
    print("   ✓ Database initialized")
    
    # Seed data
    print("\n2. Seeding data...")
    await seed_data()
    print("   ✓ Data seeded")
    
    # Test database queries
    print("\n3. Testing database queries...")
    from app.database import AsyncSessionLocal
    from app.models.news_feed import NewsFeed
    from app.models.user import User
    from sqlalchemy import select
    
    async with AsyncSessionLocal() as db:
        # Check news
        result = await db.execute(select(NewsFeed))
        news_items = result.scalars().all()
        print(f"   ✓ Found {len(news_items)} news articles")
        
        # Check user
        result = await db.execute(select(User))
        users = result.scalars().all()
        print(f"   ✓ Found {len(users)} users")
    
    print("\n4. Testing services...")
    from app.services.otp_service import OTPService
    from app.utils.helpers import generate_otp, format_phone_number
    
    # Test OTP generation
    otp = generate_otp()
    print(f"   ✓ OTP generated: {otp}")
    
    # Test phone formatting
    phone = format_phone_number("01734893480")
    print(f"   ✓ Phone formatted: {phone}")
    
    print("\n" + "=" * 50)
    print("All tests passed! ✓")
    print("\nBackend is ready to use!")
    print("Start the server with:")
    print("  cd backend && uvicorn main:app --reload")

if __name__ == "__main__":
    asyncio.run(test_backend())

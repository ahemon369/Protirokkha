from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from contextlib import asynccontextmanager
from app.config import settings
from app.database import init_db
from app.routers import (
    auth,
    users,
    emergency_contacts,
    sos,
    defenders,
    news_feed,
    profile
)


@asynccontextmanager
async def lifespan(app: FastAPI):
    # Startup: Initialize database
    await init_db()
    
    # Seed initial data
    await seed_data()
    
    yield
    
    # Shutdown: Cleanup if needed
    pass


app = FastAPI(
    title=settings.APP_NAME,
    version=settings.APP_VERSION,
    lifespan=lifespan
)

# Configure CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=settings.CORS_ORIGINS,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Include routers
app.include_router(auth.router)
app.include_router(users.router)
app.include_router(emergency_contacts.router)
app.include_router(sos.router)
app.include_router(defenders.router)
app.include_router(news_feed.router)
app.include_router(profile.router)


@app.get("/")
async def root():
    return {
        "message": "প্রতিরক্ষা (Protirokkha) API",
        "version": settings.APP_VERSION,
        "docs": "/docs",
        "redoc": "/redoc"
    }


@app.get("/health")
async def health_check():
    return {"status": "healthy"}


async def seed_data():
    """Seed initial data"""
    from app.database import AsyncSessionLocal
    from app.models.news_feed import NewsFeed
    from app.models.user import User
    from sqlalchemy import select
    
    async with AsyncSessionLocal() as db:
        # Check if news already exists
        result = await db.execute(select(NewsFeed))
        existing_news = result.scalars().first()
        
        if not existing_news:
            # Seed Bengali news articles
            news_items = [
                NewsFeed(
                    title="মোটরসাইকেল থেকে নামিয়ে তরুণকে এলোপাতাড়ি কোপ, হাসপাতালে মৃত্যু",
                    description="চট্টগ্রামে একটি মোটরসাইকেল থেকে নামিয়ে এক তরুণকে এলোপাতাড়ি কোপানোর ঘটনা ঘটেছে। আক্রান্ত তরুণ হাসপাতালে চিকিৎসাধীন অবস্থায় মারা যান।",
                    author="আশফুল কুদ্দুস",
                    category="news",
                ),
                NewsFeed(
                    title="চুরির অভিযোগে সালিসের পর গাছে ঝুলছিল যুবকের লাশ",
                    description="নোয়াখালীতে চুরির অভিযোগে স্থানীয় সালিসের পর এক যুবকের লাশ গাছে ঝুলন্ত অবস্থায় পাওয়া গেছে।",
                    author="মাহমুদ হাসান",
                    category="news",
                ),
                NewsFeed(
                    title="নোয়াখালী বিভাগের দাবিতে মাইজদীতে বিক্ষোভ",
                    description="নোয়াখালীকে পূর্ণাঙ্গ বিভাগ করার দাবিতে মাইজদীতে ব্যাপক বিক্ষোভ সমাবেশ অনুষ্ঠিত হয়েছে।",
                    author="রাকিব হোসেন",
                    category="news",
                ),
                NewsFeed(
                    title="'বন্ধুকে ভিডিও কলে' রেখে বিশ্ববিদ্যালয় ছাত্রীর গলায় ফাঁস",
                    description="ঢাকার একটি বিশ্ববিদ্যালয়ের ছাত্রী বন্ধুর সাথে ভিডিও কলে কথা বলার সময় আত্মহত্যা করেছেন।",
                    author="সাদিয়া আফরিন",
                    category="news",
                ),
                NewsFeed(
                    title="নোয়াখালীতে প্রশিক্ষণের গাড়ি পুকুরে পড়ে তরুণের মৃত্যু",
                    description="নোয়াখালীতে ড্রাইভিং প্রশিক্ষণের সময় একটি গাড়ি পুকুরে পড়ে যাওয়ায় এক তরুণের মৃত্যু হয়েছে।",
                    author="আবদুল্লাহ আল মামুন",
                    category="news",
                ),
                NewsFeed(
                    title="চট্টগ্রামে সাইবার অপরাধ বৃদ্ধির প্রবণতা",
                    description="চট্টগ্রাম মেট্রোপলিটন এলাকায় সাইবার অপরাধের ঘটনা উদ্বেগজনক হারে বৃদ্ধি পাচ্ছে।",
                    author="তানভীর রহমান",
                    category="osint",
                ),
            ]
            
            for news in news_items:
                db.add(news)
            
            await db.commit()
        
        # Check if sample user exists
        result = await db.execute(select(User).filter(User.phone == "+8801734893480"))
        existing_user = result.scalar_one_or_none()
        
        if not existing_user:
            # Create sample user (Rahimul Rahat)
            sample_user = User(
                phone="+8801734893480",
                name="Rahimul Rahat",
                email="rahimul@example.com",
                kyc_status="verified"
            )
            db.add(sample_user)
            await db.commit()

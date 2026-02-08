from fastapi import APIRouter, Depends, HTTPException, status, Query
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy import select
from typing import List
from app.database import get_db
from app.schemas.news_feed import NewsFeedResponse
from app.models.news_feed import NewsFeed
from app.models.user import User
from app.middleware.auth_middleware import get_current_user

router = APIRouter(prefix="/api/v1/feed", tags=["News Feed"])


@router.get("/", response_model=List[NewsFeedResponse])
async def list_news(
    category: str = Query(None),
    page: int = Query(1, ge=1),
    limit: int = Query(10, ge=1, le=100),
    db: AsyncSession = Depends(get_db)
):
    """List news articles with pagination"""
    query = select(NewsFeed)
    
    if category:
        query = query.filter(NewsFeed.category == category)
    
    query = query.order_by(NewsFeed.created_at.desc())
    query = query.offset((page - 1) * limit).limit(limit)
    
    result = await db.execute(query)
    news_items = result.scalars().all()
    return news_items


@router.get("/{news_id}", response_model=NewsFeedResponse)
async def get_news_detail(
    news_id: str,
    db: AsyncSession = Depends(get_db)
):
    """Get single article detail"""
    result = await db.execute(
        select(NewsFeed).filter(NewsFeed.id == news_id)
    )
    news_item = result.scalar_one_or_none()
    
    if not news_item:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="News article not found"
        )
    
    return news_item


@router.get("/search/", response_model=List[NewsFeedResponse])
async def search_news(
    q: str = Query(...),
    page: int = Query(1, ge=1),
    limit: int = Query(10, ge=1, le=100),
    db: AsyncSession = Depends(get_db)
):
    """Search news"""
    query = select(NewsFeed).filter(
        NewsFeed.title.contains(q) | NewsFeed.description.contains(q)
    )
    query = query.order_by(NewsFeed.created_at.desc())
    query = query.offset((page - 1) * limit).limit(limit)
    
    result = await db.execute(query)
    news_items = result.scalars().all()
    return news_items

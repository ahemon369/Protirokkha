from pydantic_settings import BaseSettings
from typing import List


class Settings(BaseSettings):
    APP_NAME: str = "Protirokkha API"
    APP_VERSION: str = "1.0.0"
    DEBUG: bool = True
    
    DATABASE_URL: str = "sqlite+aiosqlite:///./protirokkha.db"
    
    SECRET_KEY: str = "dev-secret-key-change-in-production"
    ALGORITHM: str = "HS256"
    ACCESS_TOKEN_EXPIRE_MINUTES: int = 10080
    
    OTP_EXPIRY_SECONDS: int = 300
    
    CORS_ORIGINS: List[str] = ["http://localhost:3000", "http://localhost:8080", "*"]
    
    class Config:
        env_file = ".env"
        case_sensitive = True


settings = Settings()

# backend/app/main.py
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from fastapi.middleware.trustedhost import TrustedHostMiddleware
import logging
import os
from dotenv import load_dotenv
from app import models  # 🔥 VERY IMPORTANT
from app.database import engine,Base
from app.routes import users, posts

Base.metadata.create_all(bind=engine)# Load environment variables
load_dotenv()

# Configure logging
logging.basicConfig(
    level=getattr(logging, os.getenv('LOG_LEVEL', 'info').upper()),
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
)

logger = logging.getLogger(__name__)

# Create FastAPI app
app = FastAPI(
    title=os.getenv('APP_NAME', 'Faculty App API'),
    version=os.getenv('APP_VERSION', '1.0.0'),
    docs_url="/docs" if os.getenv('ENVIRONMENT') == 'development' else None,
    redoc_url="/redoc" if os.getenv('ENVIRONMENT') == 'development' else None,
)

# CORS middleware
app.add_middleware(
    CORSMiddleware,
    allow_origins=[
        "http://localhost:5173",
        "http://127.0.0.1:5173",
    ],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Trusted hosts middleware (production only)
if os.getenv('ENVIRONMENT') == 'production':
    app.add_middleware(
        TrustedHostMiddleware,
        allowed_hosts=["*"]  # Configure with your actual domains in production
    )

# Import routers (adjust paths as needed)
from app.routes import users

app.include_router(users.router, prefix="/api/users", tags=["users"])
app.include_router(posts.router, prefix="/api/posts", tags=["posts"])

@app.get("/")
async def root():
    return {
        "message": "Faculty App API",
        "version": app.version,
        "environment": os.getenv('ENVIRONMENT', 'development')
    }

@app.get("/health")
async def health_check():
    return {
        "status": "healthy",
        "service": "api",
        "environment": os.getenv('ENVIRONMENT', 'development')
    }

# Optional: Add startup event
@app.on_event("startup")
async def startup_event():
    logger.info("Starting up Faculty App API...")
    # Add any startup tasks here (e.g., database connection check)

# Optional: Add shutdown event
@app.on_event("shutdown")
async def shutdown_event():
    logger.info("Shutting down Faculty App API...")
    # Add any cleanup tasks here


from app.core.exception_handlers import *
from app.core.exceptions import *
from sqlalchemy.exc import IntegrityError



app.add_exception_handler(AppException, app_exception_handler)
app.add_exception_handler(NotFoundException, not_found_handler)
app.add_exception_handler(ForbiddenException, forbidden_handler)
app.add_exception_handler(IntegrityError, db_integrity_handler)
app.add_exception_handler(Exception, generic_exception_handler)
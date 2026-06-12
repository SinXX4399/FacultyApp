from fastapi.responses import JSONResponse
from fastapi import Request
from sqlalchemy.exc import IntegrityError
from .exceptions import *

# Custom app exceptions
async def app_exception_handler(request: Request, exc: AppException):
    return JSONResponse(
        status_code=400,
        content={"detail": exc.message}
    )

# HTTP exceptions
async def not_found_handler(request: Request, exc: NotFoundException):
    return JSONResponse(
        status_code=404,
        content={"detail": exc.message}
    )

# Forbidden exceptions
async def forbidden_handler(request: Request, exc: ForbiddenException):
    return JSONResponse(
        status_code=403,
        content={"detail": exc.message}
    )


# SQLAlchemy error
async def db_integrity_handler(request: Request, exc: IntegrityError):
    return JSONResponse(
        status_code=400,
        content={"detail": "Database constraint error"}
    )


# Fallback (VERY IMPORTANT)


from .logging import logger

async def generic_exception_handler(request: Request, exc: Exception):
    logger.error(f"Unhandled error: {str(exc)}")

    return JSONResponse(
        status_code=500,
        content={"detail": "Internal Server Error"}
    )
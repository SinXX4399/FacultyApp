from fastapi import APIRouter, Depends, HTTPException, status, Query
from sqlalchemy.orm import Session
from sqlalchemy.exc import IntegrityError
from typing import List, Optional

from ..models.User import UserModel
from ..database import get_db
from ..auth.jwt import create_access_token, create_refresh_token
from ..auth.dependencies import verify_password, hash_password, get_current_user
from ..auth.roles import require_role
from ..schemas.User import UserCreate, UserResponse, UserLogin, UserUpdate
from ..schemas.Token import TokenResponse
from ..services.user_service import create_user_service, get_user_by_id_service, get_all_users_service, delete_user_service, update_user_service, get_user_by_name_service, get_user_by_year_service, get_user_by_branch_service, get_user_by_faculty_service
from ..services.user_service import get_user_by_username_service
router = APIRouter(
    prefix="/users",
    tags=["Users"]
)


# Create a new user
@router.post("/",response_model=UserResponse)
def create_user(
    user:UserCreate,
    db: Session = Depends(get_db)
):
    return create_user_service(db, user)

# Get user by ID
@router.get("/{user_id}", response_model=UserResponse)
def get_user_by_id(
    user_id: str,
    db: Session = Depends(get_db),
    current_user=Depends(get_current_user)
):
    return get_user_by_id_service(db, user_id)

# Get all users
@router.get("/", response_model=List[UserResponse])
def get_all_users(
    db: Session = Depends(get_db),
    current_user=Depends(get_current_user)
):
    return get_all_users_service(db)

# Delete user by ID
@router.delete("/{user_id}", status_code=status.HTTP_204_NO_CONTENT)
def delete_user(
    user_id: str,
    db: Session = Depends(get_db),
    current_user=Depends(get_current_user)
):
    delete_user_service(db, user_id)

# Update user by ID
@router.put("/{user_id}", response_model=UserResponse)
def update_user(
    user_id: str,
    update_data: UserUpdate,
    db: Session = Depends(get_db),
    current_user=Depends(get_current_user)
):
    updated_user = update_user_service(db, user_id, update_data.model_dump(exclude_unset=True))
    if not updated_user:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="User not found")
    return updated_user

# Get user by name
@router.get("/search/name", response_model=UserResponse)
def get_user_by_name(
    name: str = Query(..., min_length=1),
    db: Session = Depends(get_db),
    current_user=Depends(get_current_user)
):
    return get_user_by_name_service(db, name)

# Get users by year
@router.get("/search/year", response_model=List[UserResponse])
def get_user_by_year(
    year: int = Query(..., ge=1, le=6),
    db: Session = Depends(get_db),
    current_user=Depends(get_current_user)
):
    return get_user_by_year_service(db, year)

# Get users by branch
@router.get("/search/branch", response_model=List[UserResponse])
def get_user_by_branch(
    branch: str = Query(..., min_length=1),
    db: Session = Depends(get_db),
    current_user=Depends(get_current_user)
):
    return get_user_by_branch_service(db, branch)

# Get users by faculty
@router.get("/search/faculty", response_model=List[UserResponse])
def get_user_by_faculty(
    faculty: str = Query(..., min_length=1),
    db: Session = Depends(get_db),
    current_user=Depends(get_current_user)
):
    return get_user_by_faculty_service(db, faculty)

@router.post("/login", response_model=TokenResponse)
def login(
    credentials: UserLogin,
    db: Session = Depends(get_db)
):
    user = get_user_by_username_service(db, credentials.username)

    if not user or not verify_password(credentials.password, user.password):
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Invalid credentials"
        )

    access_token = create_access_token({"user_id": user.id})
    refresh_token = create_refresh_token({"user_id": user.id})

    return {
    "access_token": access_token,
    "refresh_token": refresh_token,
    "token_type": "bearer",
    "user": user
    }
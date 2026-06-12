from pydantic import BaseModel, Field
from typing import Optional
from enum import Enum







from datetime import datetime
# ---------------- CREATE ----------------
class UserCreate(BaseModel):
    user_code: str = Field(..., min_length=3, max_length=50)
    name: str = Field(..., min_length=1, max_length=100)
    sname: str = Field(..., min_length=1, max_length=100)
    password: str = Field(..., min_length=5)
    email: str = Field(..., max_length=100)
    department: int = Field(..., gt=0)
    phonenumber: str= Field(..., max_length=10)
    branch_id:int = Field(..., gt=0)
    faculty_id:int = Field(..., gt=0)
    year: int = Field(..., ge=1, le=6)
    role_id: int = Field(..., gt=0)
    is_active: int = 1
    created_at: datetime = Field(default_factory=datetime.utcnow)


# ---------------- RESPONSE ----------------
class UserResponse(BaseModel):
    id: int
    user_code: str
    username: str
    name: str
    sname: str
    branch_id: int
    faculty_id: int
    department: int
    year: int
    role_id : int

    class Config:
        from_attributes = True


# ---------------- LOGIN ----------------
class UserLogin(BaseModel):
    username: str
    password: str


# ---------------- UPDATE ----------------
class UserUpdate(BaseModel):

    username: Optional[str] = Field(None, min_length=3, max_length=50)
    name: Optional[str] = Field(None, min_length=1, max_length=100)
    sname: Optional[str] = Field(None, min_length=1, max_length=100)
    user_code: Optional[str] = Field(None, min_length=3, max_length=50)
    password: Optional[str] = Field(None, min_length=5)
    email: Optional[str] = Field(None, max_length=100)
    phonenumber: Optional[str] = Field(None, max_length=10)
    department_id: Optional[int] = None
    branch_id: Optional[int] = None
    faculty_id: Optional[int] = None
    year: Optional[int] = Field(None, ge=1, le=6)
    updated_at: Optional[datetime] = Field(default_factory=datetime.utcnow)
    role_id: Optional[int] = Field(None, gt=0)
    
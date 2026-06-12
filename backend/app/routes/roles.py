from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from ..database import get_db
from ..models.RolePermission import Role
from ..models.Permission import Permission
from ..models.User import UserModel as User
router = APIRouter(
    prefix="/roles",
    tags=["Roles"]
)
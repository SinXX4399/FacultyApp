
from fastapi import Depends, HTTPException, status
from sqlalchemy.orm import Session
from ..database import get_db
from .. import models
from ..auth.dependencies import get_current_user

from typing import List

def require_role(allowed_roles: List[str]):
    def role_checker(current_user: models.User = Depends(get_current_user)):
        if current_user.role not in allowed_roles:
            raise HTTPException(
                status_code=status.HTTP_403_FORBIDDEN,
                detail="Insufficient permissions"
            )
        return current_user

    return role_checker


def require_permission(permission: str):
    def checker(current_user = Depends(get_current_user)):
        user_permissions = [p.name for p in current_user.role.permissions]

        if permission not in user_permissions:
            raise HTTPException(status_code=403, detail="Forbidden")

        return current_user

    return checker
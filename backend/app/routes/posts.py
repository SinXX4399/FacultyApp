from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from typing import List
from ..auth.dependencies import get_current_user
from ..models.User import UserModel
from datetime import datetime
from sqlalchemy.exc import IntegrityError
from ..core.exceptions import *
from ..services.post_service import create_post_service, get_post_service

from ..models.Post import PostModel
from ..database import get_db

from ..schemas.Post import PostCreate, PostResponse
from ..auth.roles import require_role, require_permission
router = APIRouter(
    prefix="/posts",
    tags=["Posts"],
)


# ✅ Create a new post
@router.post("/", response_model=PostResponse)
def create_post(
    post: PostCreate,
    db: Session = Depends(get_db),
    current_user = Depends(require_permission("create_post"))
):
    return create_post_service(db, post, current_user.id)

#✅ Get Post by ID
@router.get("/{id}", response_model=PostResponse)
def get_post(
    id: int,
    db: Session = Depends(get_db),
    current_user = Depends(require_permission(["admin", "teacher"]))

):
    return get_post_service(db, id)


from ..services.post_service import get_all_posts_service,delete_post_service

#Get✅  all Posts (Owner only)
@router.get("/", response_model=List[PostResponse])
def get_all_posts(
    db: Session = Depends(get_db),
    current_user = Depends(require_role(["admin", "teacher"]))
):
    return get_all_posts_service(db, current_user.id)

#✅ delete post by ID
@router.post("/{id}/delete", status_code=204)
def delete_post(
    id: int,
    db: Session = Depends(get_db),
    current_user = Depends(require_role(["admin", "teacher"]))
):
    return delete_post_service(db, id, current_user.id)


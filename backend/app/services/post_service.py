from sqlalchemy.orm import Session
from app.models import PostModel
from app.core.exceptions import *

def create_post_service(db: Session, post, user_id: int):
    new_post = PostModel(**post.model_dump(exclude={"created_at"}), owner_id=user_id)

    db.add(new_post)
    db.commit()
    db.refresh(new_post)

    return new_post


def get_post_service(db: Session, post_id: int):
    post = db.query(PostModel).filter(PostModel.id == post_id).first()

    if not post:
        raise NotFoundException("Post not found")

    return post

def get_all_posts_service(db: Session, user_id: int):
    posts = db.query(PostModel).filter(PostModel.owner_id == user_id).all()
    if not posts:
        raise NotFoundException("No posts found for this user")
    
    return posts()


def delete_post_service(db: Session, post_id: int, user_id: int):
    post = db.query(PostModel).filter(PostModel.id == post_id).first()

    if not post:
        raise NotFoundException("Post not found")

    if post.owner_id != user_id:
        raise ForbiddenException("Not allowed")

    db.delete(post)
    db.commit()
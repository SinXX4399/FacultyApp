from pydantic import BaseModel
from datetime import datetime
from typing import Optional
from enum import Enum

class PostStatus(str, Enum):
    open = "open"
    closed = "closed"


    
class PostCreate(BaseModel):
    title: str
    content: str
    deadline: Optional[datetime] = None
    status: PostStatus = PostStatus.open
    created_at: datetime = datetime.utcnow()
    owner_id: int


class PostResponse(BaseModel):
    id: int
    title: str
    content: str
    deadline: datetime | None
    status: str
    owner_id: int
    created_at: datetime

    class Config:
        from_attributes = True
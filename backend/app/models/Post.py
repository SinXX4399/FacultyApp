
# ---------------- POST ----------------
from sqlalchemy import Column, Integer, String, ForeignKey, DateTime
from sqlalchemy.orm import relationship
from datetime import datetime
from ..database import Base

class PostModel(Base):
    __tablename__ = "posts"

    id = Column(Integer, primary_key=True, index=True)
    title = Column(String, nullable=False)
    content = Column(String, nullable=False)

    deadline = Column(DateTime, nullable=True)
    created_at = Column(DateTime, default=datetime.utcnow)

    status = Column(String, default="open")

    owner_id = Column(Integer, ForeignKey("users.id"))

    # 🔥 relationship
    owner = relationship("UserModel", back_populates="post",passive_deletes=True)

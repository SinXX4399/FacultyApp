from sqlalchemy import Column, Integer, String, ForeignKey, DateTime
from sqlalchemy.orm import relationship
from sqlalchemy.sql import func
from ..database import Base


class MajorModel(Base):
    __tablename__ = "majors"

    id = Column(Integer, primary_key=True, index=True)

    name = Column(String, nullable=False, unique=True)
    abbreviation = Column(String, nullable=False, unique=True)

    faculty_id = Column(Integer, ForeignKey("faculties.id"), nullable=False)

    created_at = Column(DateTime(timezone=True), server_default=func.now())

    # 🔥 relationships
    faculty = relationship("FacultyModel", back_populates="major")

    users = relationship(
        "UserModel",
        back_populates="major",
        cascade="all, delete-orphan"
    )
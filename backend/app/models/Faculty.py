from sqlalchemy import Column, Integer, String, DateTime
from sqlalchemy.orm import relationship
from sqlalchemy.sql import func
from ..database import Base


class FacultyModel(Base):
    __tablename__ = "faculties"

    id = Column(Integer, primary_key=True, index=True)

    name = Column(String, unique=True, nullable=False)
    abbreviation = Column(String, unique=True, nullable=False)

    created_at = Column(DateTime(timezone=True), server_default=func.now())

    # 🔥 relationship
    majors = relationship(
        "MajorModel",
        back_populates="faculty",
        cascade="all, delete-orphan"
    )
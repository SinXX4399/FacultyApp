from sqlalchemy import Column, Integer, String, Boolean, DateTime, ForeignKey, Table
from sqlalchemy.orm import relationship
from sqlalchemy.sql import func
from ..database import Base
from .Branch import BranchModel
from .Faculty import FacultyModel
from .RolePermission import Role, role_permissions, Permission
from .Department import DepartmentModel





# =========================
# 🔥 USER MODEL
# =========================
class UserModel(Base):
    __tablename__ = "users"

    id = Column(Integer, primary_key=True, index=True)

    user_code = Column(String, unique=True, nullable=False, index=True)
    username = Column(String, unique=True, nullable=False, index=True)

    name = Column(String, nullable=False)
    sname = Column(String, nullable=False)

    email = Column(String, unique=True, nullable=False)
    password = Column(String, nullable=False)

    phonenumber = Column(String,unique=True, nullable=False)
    avatar_url = Column(String, nullable=True)

    
    # ✅ FOREIGN KEYS
    department_id= Column(Integer, ForeignKey("departments.id"), nullable=False)
    branch_id = Column(Integer, ForeignKey("branches.id"), nullable=False)
    faculty_id = Column(Integer, ForeignKey("faculties.id"), nullable=False)
    role_id = Column(Integer, ForeignKey("roles.id"), nullable=False)

    year = Column(Integer, nullable=False)

    is_active = Column(Boolean, default=True)

    created_at = Column(DateTime(timezone=True), server_default=func.now())
    updated_at = Column(DateTime(timezone=True), onupdate=func.now())

    # ✅ RELATIONSHIPS
    role = relationship("Role", back_populates="users")

    branch = relationship("BranchModel", back_populates="users")
    faculty = relationship("FacultyModel", back_populates="users")
    department = relationship("DepartmentModel", back_populates="users")
    posts = relationship(
        "PostModel",
        back_populates="owner",
        cascade="all, delete-orphan"
    )
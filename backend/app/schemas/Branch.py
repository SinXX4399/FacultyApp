from pydantic import BaseModel, Field
from typing import Optional
from app.schemas.Faculty import FacultyResponse


# ---------------- CREATE ----------------
class BranchCreate(BaseModel):
    name: str = Field(..., min_length=1, max_length=100)
    abbreviation: str = Field(..., min_length=1, max_length=20)
    faculty_id: int = Field(..., gt=0)


# ---------------- RESPONSE (FULL) ----------------
class BranchResponse(BaseModel):
    id: int
    name: str
    abbreviation: str
    faculty: FacultyResponse

    model_config = {
        "from_attributes": True
    }


# ---------------- RESPONSE (LIGHTWEIGHT) ----------------
class BranchSimpleResponse(BaseModel):
    id: int
    name: str

    model_config = {
        "from_attributes": True
    }


# ---------------- UPDATE ----------------
class BranchUpdate(BaseModel):
    name: Optional[str] = Field(None, min_length=1, max_length=100)
    abbreviation: Optional[str] = Field(None, min_length=1, max_length=20)
    faculty_id: Optional[int] = Field(None, gt=0)
from pydantic import BaseModel, Field
from typing import Optional


# ---------------- CREATE ----------------
class FacultyCreate(BaseModel):
    name: str = Field(..., min_length=1, max_length=100)
    abbreviation: str = Field(..., min_length=1, max_length=20)


# ---------------- RESPONSE ----------------
class FacultyResponse(BaseModel):
    id: int
    name: str
    abbreviation: str

    model_config = {
        "from_attributes": True
    }


# ---------------- UPDATE ----------------
class FacultyUpdate(BaseModel):
    name: Optional[str] = Field(None, min_length=1, max_length=100)
    abbreviation: Optional[str] = Field(None, min_length=1, max_length=20)
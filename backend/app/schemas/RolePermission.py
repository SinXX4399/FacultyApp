from pydantic import BaseModel, Field


# ---------------- CREATE ----------------
class PermissionCreate(BaseModel):
    name: str = Field(..., min_length=1, max_length=100)


# ---------------- RESPONSE ----------------
class PermissionResponse(BaseModel):
    id: int
    name: str

    model_config = {
        "from_attributes": True
    }

from typing import List


# ---------------- CREATE ----------------
class RoleCreate(BaseModel):
    name: str = Field(..., min_length=1, max_length=50)


# ---------------- RESPONSE (simple) ----------------
class RoleResponse(BaseModel):
    id: int
    name: str

    model_config = {
        "from_attributes": True
    }


class RoleWithPermissions(BaseModel):
    id: int
    name: str
    permissions: List[PermissionResponse]

    model_config = {
        "from_attributes": True
    }


class RolePermissionAssign(BaseModel):
    permission_ids: List[int]


from typing import Optional


class RoleUpdate(BaseModel):
    name: Optional[str] = Field(None, min_length=1, max_length=50)
from pydantic import BaseModel
from app.schemas.User import UserResponse
class TokenResponse(BaseModel):
    access_token: str
    refresh_token: str
    token_type: str
    user: UserResponse
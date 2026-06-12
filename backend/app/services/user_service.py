from sqlalchemy.orm import Session
from app.models import UserModel
from app.auth.dependencies import hash_password
from app.schemas.User import UserCreate
from fastapi import HTTPException
from app.models import  BranchModel
def create_user_service(db: Session, user: UserCreate):
    user_data = user.model_dump(exclude_unset=True)

    # 🔥 Check duplicate user_code
    existing_user = db.query(UserModel).filter(
        UserModel.user_code == user_data["user_code"]
    ).first()

    if existing_user:
        raise HTTPException(status_code=400, detail="User already exists")

    # 🔥 Check email
    if db.query(UserModel).filter(UserModel.email == user_data["email"]).first():
        raise HTTPException(status_code=400, detail="Email already in use")

    # 🔥 Auto username
    username = f"u{user_data['user_code']}"

    if db.query(UserModel).filter(UserModel.username == username).first():
        raise HTTPException(status_code=400, detail="Username already exists")

    # 🔐 Hash password
    user_data["password"] = hash_password(user_data["password"])
    user_data["username"] = username

    # 🔥 OPTIONAL (recommended)
    # auto-set faculty from branch
    branch = db.query(BranchModel).get(user_data["branch_id"])
    user_data["faculty_id"] = branch.faculty_id

    new_user = UserModel(**user_data)

    db.add(new_user)
    db.commit()
    db.refresh(new_user)

    return new_user



def get_user_by_id_service(db: Session, user_id: int):
    return db.query(UserModel).filter(UserModel.user_id == user_id).first()

def get_all_users_service(db: Session):
    
    return db.query(UserModel).all()

def delete_user_service(db: Session, user_id: int):
    user = db.query(UserModel).filter(UserModel.user_id == user_id).first()

    if user:
        db.delete(user)
        db.commit()

def update_user_service(db: Session, user_id: int, update_data: dict):
    user = db.query(UserModel).filter(UserModel.user_id == user_id).first()

    if not user:
        return None

    for key, value in update_data.items():
        setattr(user, key, value)

    db.commit()
    db.refresh(user)

    return user

def get_user_by_username_service(db: Session, username: str):
    return db.query(UserModel).filter(UserModel.username == username).first()

def get_user_by_name_service(db: Session, name: str):
    return db.query(UserModel).filter(UserModel.name == name).first()

def get_user_by_year_service(db: Session, year: int):
    return db.query(UserModel).filter(UserModel.year == year).all()

def get_user_by_branch_service(db: Session, branch: str):
    return db.query(UserModel).filter(UserModel.branch == branch).all()

def get_user_by_faculty_service(db: Session, faculty: str):
    return db.query(UserModel).filter(UserModel.faculty == faculty).all()


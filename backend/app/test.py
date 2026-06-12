from sqlalchemy import create_engine

engine = create_engine(
    "postgresql://faculty_user:faculty_password@127.0.0.1:5432/faculty_db"
)

with engine.connect():
    print("Connected!")
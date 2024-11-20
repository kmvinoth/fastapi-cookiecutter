from fastapi import FastAPI
from fastapi import FastAPI, HTTPException, Depends
from fastapi.middleware.cors import CORSMiddleware

from app.db.my_database import database

from loguru import logger

logger.info("Logger Initialized")

app = FastAPI()


@app.get("/")
async def home():
    return {"message": ""Hi there! Please find the documentation at /docs"}

from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from typing import Union
from regression_model import model_;

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=['*']
)


@app.get('/get_')
async def get():
    return {'prediction':'hello'}


@app.post('/get_prediction')
def getData(coreI,generation,firstHDDType,firstHDDSize,secondHDDType,secondHDDSize,ramSize,batteryLife,screenSize,screenType,GPU,laptopState):
    coreI = float(coreI)
    generation = float(generation)
    firstHDDType = float(firstHDDType)
    firstHDDSize = float(firstHDDSize)
    secondHDDType = float(secondHDDType)
    secondHDDSize = float(secondHDDSize)
    ramSize = float(ramSize)
    batteryLife = float(batteryLife)
    screenSize = float(screenSize)
    screenType = float(screenType)


    prediction = model_(coreI,generation,firstHDDType,firstHDDSize,secondHDDType,secondHDDSize,ramSize,batteryLife,screenSize,screenType,GPU,laptopState)
    return prediction







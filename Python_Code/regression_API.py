from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from typing import Union
from regression_model import model;

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=['*']
)


@app.post('/get_prediction')
async def get_prediction(request:Request):
    data = await request.json()
    coreI = data.get('coreI')
    generation = data.get('generation')
    firstHDDType = data.get('firstHDDType')
    firstHDDSize = data.get('firstHDDSize')
    secondHDDType = data.get('secondHDDType')
    secondHDDSize = data.get('secondHDDSize')
    ramSize = data.get('ramSize')
    batteryLife = data.get('batteryLife')
    screenSize = data.get('screenSize')
    screenType = data.get('screenType')
    gcType = data.get('gcType')
    laptopState = data.get('laptopState')
    prediction = model(coreI,generation,firstHDDType,firstHDDSize,secondHDDType,secondHDDSize,ramSize,batteryLife,screenSize,screenType,gcType,laptopState)
    return prediction
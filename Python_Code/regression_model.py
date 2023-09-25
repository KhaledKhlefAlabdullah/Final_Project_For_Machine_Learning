# import libraries
import pickle
import pandas as pd
import re

def model_(coreI,generation,firstHDDType,firstHDDSize,secondHDDType,secondHDDSize,ramSize,batteryLife,screenSize,screenType,GPU,laptopState):

    # Load your trained Linear Regression model
    with open('linear_regression_model.pkl', 'rb') as model_file:
        model = pickle.load(model_file)

    # Clining the gpu data
    if GPU == 'مدمج':
        GPU = float(GPU.replace("مدمج","50"))

    GPU = GPU.strip()
    split_gpu = GPU.split(' ')
    GPU = split_gpu[0]
    
    GPU = float(re.search(r'\d+', GPU).group())

    # Clean GC data 
    new=0
    old=0
    obenBox=0
    if laptopState == 'New':
        new=1
    elif laptopState == 'Old':
        old=1
        print(old)
    else:
        obenBox=1

    predictions = model.predict([[	coreI,	generation,firstHDDType,	firstHDDSize,	secondHDDType,	secondHDDSize,	ramSize,	batteryLife,	screenSize,	screenType	,GPU,	new , obenBox,	old]])
    return int(predictions)

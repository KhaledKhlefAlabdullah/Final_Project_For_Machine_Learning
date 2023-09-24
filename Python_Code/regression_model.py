# import libraries
import pickle

def model(coreI,generation,firstHDDType,firstHDDSize,secondHDDType,secondHDDSize,ramSize,batteryLife,screenSize,screenType,gcType,laptopState):

     # Load your trained Linear Regression model
    with open('linear_regression_model.pkl', 'rb') as model_file:
        model = pickle.load(model_file)

    new=0
    old=0
    obenBox=0
    if laptopState == 'New':
        new=1
    elif laptopState == 'Old':
        old=1
    else:
        obenBox=1

    predictions = model.predict([[	coreI,	generation,	generation,	firstHDDSize,	secondHDDType,	secondHDDSize,	ramSize,	batteryLife,	screenSize,	screenType	,gcType,	new , obenBox,	old]])
    return predictions

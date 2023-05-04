import json
import pickle
import numpy as np
__governorate = None
__data_columns = None
__model = None

def get_estimated_price(governorate,area,room,bathroom,garage,garden,pool,furnished,equipped_kitchen,central_heating,air_conditioning):
    try:
       loc_index = __data_columns.index(governorate.lower())
    except:
        loc_index = -1

    x = np.zeros(len(__data_columns))
    x[0] = area
    x[1] = room
    x[2] = bathroom
    x[3] = garage
    x[4] = garden
    x[5] = pool
    x[6] = furnished
    x[7] = equipped_kitchen
    x[8] = central_heating
    x[9] = air_conditioning
    if loc_index >= 0:
        x[loc_index] = 1

    return round(__model.predict([x])[0],2)

def load_saved_artifacts():
    print("loding saved artifacts...start")
    global __data_columns
    global __governorate

    with open("./artifacts/columns.json","r") as f:
     __data_columns = json.load(f)['data_columns']
     __governorate = __data_columns[10:]

    global __model
    if __model is None:
        with open("./artifacts/house_prediction_model", 'rb') as f:
            __model = pickle.load(f)
    print("loading saved artifacts...done")

def get_governorate_names():
    return __governorate

def get_data_columns():
    return __data_columns

if __name__ == '__main__':
    load_saved_artifacts()
    print(get_governorate_names())
    print(get_estimated_price('tunis', 500, 5, 2, 0, 0, 0, 0, 0, 1, 1))
    print(get_estimated_price('tunis', 700, 8, 4, 1, 0, 1, 1, 0, 1, 1))
    print(get_estimated_price('tunis', 1000, 10, 6, 1, 1, 1, 1, 1, 1, 1))
from flask import Flask, request, jsonify
from flask_cors import CORS


import util

app = Flask(__name__)
CORS(app)

@app.route('/get_governorate_names', methods=['GET'])
def get_governorate_names():
    response = jsonify({
        'governorate' : util.get_governorate_names()
    })
    response.headers.add('Access-Control-Allow-Origin', '*')

    return response

@app.route('/predict_home_price', methods=['POST'])
def predict_home_price():
    try:
        governorate = request.form['governorate']
        area = float(request.form['area'])
        room = int(request.form['room'])
        bathroom = int(request.form['bathroom'])
        garage = int(request.form['garage'])
        garden = int(request.form['garden'])
        pool = int(request.form['pool'])
        furnished = int(request.form['furnished'])
        equipped_kitchen = int(request.form['equipped_kitchen'])
        central_heating = int(request.form['central_heating'])
        air_conditioning = int(request.form['air_conditioning'])

        response = jsonify({
            'estimated_price': util.get_estimated_price(governorate, area, room, bathroom, garage, garden, pool, furnished, equipped_kitchen, central_heating, air_conditioning )
        })
        response.headers.add('Access-Control-Allow-Origin', '*')
        return response

    except Exception as e:
        return jsonify({'error': str(e)})


if __name__ == "__main__":
    print("Starting Python Flask Server For Home Price Prediction...")
    util.load_saved_artifacts()
    app.run()






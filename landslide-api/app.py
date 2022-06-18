from flask import Flask, jsonify, request
import pandas as pd
import numpy as np
import joblib
import traceback
from flask_restful import reqparse
app = Flask(__name__)

@app.route('/predict', methods=['POST'])
def predict():
	xgb = joblib.load("model_xgb.pkl")
	reg = joblib.load("model_reg.pkl")
	forest = joblib.load("model_forest.pkl")
	if xgb and reg and forest:
		try:
			json = request.get_json()	 
			model_columns = joblib.load("model_cols.pkl")
			model_columns = list(model_columns)
			temp=list(json[0].values())
			vals=np.array(temp)
			input_variables = pd.DataFrame([temp],
                            columns=model_columns,
                            index=[1])
			prediction_xgb = xgb.predict(input_variables)
			prediction_reg = reg.predict_proba(input_variables)[:,1]
			prediction_forest = forest.predict_proba(input_variables)[:,1]
			print("here:",prediction_xgb)        
			return jsonify({'prediction': str(((prediction_xgb[0]) + (prediction_reg[0]) + (prediction_forest[0]))/3)})

		except:        
			return jsonify({'trace': traceback.format_exc()})
	else:
		return ('No model here to use')
    


if __name__ == '__main__':
    app.run(debug=True)
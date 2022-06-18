import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_easyloading/flutter_easyloading.dart';

// ignore: must_be_immutable
class Main extends StatelessWidget {
  late double MONTH,
    latitude,
    longitude,
    PRECTOT,
    PS,
    RH2M,
    T2M,
    avg_windspeed;
  late String place;

//METHOD TO PREDICT PRICE
  Future<String?> predictPrice(var body) async {
    var client = new http.Client();
    var uri = Uri.parse("https://landslideapi.azurewebsites.net/predict");
    Map<String, String> headers = {"Content-type": "application/json"};
    String jsonString = json.encode(body);
    try {
      var resp = await client.post(uri, headers: headers, body: jsonString);
      if (resp.statusCode == 200) {
        print("DATA FETCHED SUCCESSFULLY");
        var result = json.decode(resp.body);
        print(result["prediction"]);
        return (result["prediction"]);
      }
    } catch (e) {
      print("EXCEPTION OCCURRED: $e");
      return null;
    }
    return null;
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(FontAwesomeIcons.arrowLeft,color: Colors.black,),
            onPressed: () => Navigator.pop(context)),
        title: Text("Predict Yourself!",style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white70,
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20,right: 20,bottom: 20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter Place Name',
                  ),
                  onChanged: (val) {
                    place = val;
                  },
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter Month In Digit(Jan denoted by 1)',
                  ),
                  onChanged: (val) {
                    MONTH = double.parse(val);
                  },
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter latitute'
                  ),
                  onChanged: (val) {
                    latitude = double.parse(val);
                  },
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter longitute',
                  ),
                  onChanged: (val) {
                    longitude = double.parse(val);
                  },
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter Precipitation(mm per day)',
                  ),
                  onChanged: (val) {
                    PRECTOT= double.parse(val);
                  },
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter Surface Pressure(kPa)',
                  ),
                  onChanged: (val) {
                    PS = double.parse(val);
                  },
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Relative Humidity(%)',
                  ),
                  onChanged: (val) {
                    RH2M = double.parse(val);
                  },
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter Temperature(C)',
                  ),
                  onChanged: (val) {
                    T2M = double.parse(val);
                  },
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter Average Wind Speed(m/s)',
                  ),
                  onChanged: (val) {
                    avg_windspeed = double.parse(val);
                  },
                ),
                SizedBox(height: 13,),
                FlatButton(
                  
                  color: Colors.blue,
                  onPressed: () async {
                    var body = [
                      {
                        "MONTH": MONTH,
                        "latitude":latitude,
                        "longitude":longitude,
                        "PRECTOT":PRECTOT*30,
                        "PS":PS,
                        "RH2M":RH2M,
                        "T2M":T2M,
                        "avg_windspeed":avg_windspeed,
                      }
                    ];
                    EasyLoading.showInfo('Predicting');
                    print(body);
                    var resp = await predictPrice(body);
                    _onBasicAlertPressed(context, resp);
                  },
                  child: Text("Get Risk Prediction"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//function from rflutter pkg to display alert
_onBasicAlertPressed(context, resp) {
  Alert(context: context, title: "Predicted Risk(Scale 0-1)", desc: resp).show();
  EasyLoading.dismiss();
}


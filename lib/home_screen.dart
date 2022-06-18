import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'past_nep_data.dart';
import 'report_landslide.dart';
import 'visualization.dart';
import 'google_map.dart';
import 'ml_prediction.dart';
import 'world_risk_map.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var cardTextStyle = TextStyle(
        fontFamily: "Montserrat Regular",
        fontSize: 14,
        color: Color.fromRGBO(63, 63, 63, 1));

    return Scaffold(
            appBar: AppBar(
        title: Text(
          "Landslide Prediction App",
          style: TextStyle(color: Colors.black),
        ),
        
        backgroundColor: Colors.white70,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .3,
            decoration: BoxDecoration(
              image: DecorationImage(
                  alignment: Alignment.topCenter,
                  image: AssetImage('assets/images/top_header.png')),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 64,
                    margin: EdgeInsets.only(bottom: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          width: 16,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Welcome to PKL',
                              style: TextStyle(
                                  fontFamily: "Montserrat Medium",
                                  color: Colors.white,
                                  fontSize: 20),
                            ),
                            Text(
                              'Prediction at your fingertip',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontFamily: "Montserrat Regular"),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: GridView.count(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      primary: false,
                      crossAxisCount: 2,
                      children: <Widget>[
                        InkWell(
                          onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => Googlemap(),
                                        ),
                                      ), 
                          child: Card(
                            shape:RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)
                            ),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SvgPicture.asset('assets/images/location_icon.svg',
                                height: 128,
                              ),
                              SizedBox(height: 7,),
                                Text(
                                  'Risky Districts',
                                  style: cardTextStyle,
                                )
                              ],
                            ),
                          ),
                        ),

                        InkWell(
                          onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => Main(),
                                        ),
                                      ), 
                          child: Card(
                            shape:RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)
                            ),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SvgPicture.asset('assets/images/predict1_icon.svg',
                                height: 128,
                              ),
                              SizedBox(height: 7,),
                                Text(
                                  'Predict Risk Yourself',
                                  style: cardTextStyle,
                                )
                              ],
                            ),
                          ),
                        ),

                                               InkWell(
                          onTap:() => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => PastNepalData(),
                                        ),
                                      ), 
                          child: Card(
                            shape:RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)
                            ),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SvgPicture.asset(
                                  'assets/images/np.svg',
                                  height: 115,
                                ),
                                SizedBox(height: 7,),
                                Text(
                                  'Past Landslide Data',
                                  style: cardTextStyle,
                                )
                              ],
                            ),
                          ),
                        ),

                        InkWell(
                          onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => Visualization(),
                                        ),
                                      ), 
                          child: Card(
                            shape:RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)
                            ),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SvgPicture.asset('assets/images/chart_icon.svg',
                                  height: 128,
                                ),
                                SizedBox(height: 7,),
                                Text(
                                  'Visualization',
                                  style: cardTextStyle,
                                )
                              ],
                            ),
                          ),
                        ),


                         InkWell(
                          onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => WorldRiskMap(),
                                        ),
                                      ), 
                          child: Card(
                            shape:RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)
                            ),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                               SvgPicture.asset('assets/images/globe_icon.svg',
                                height: 128,
                              ),
                              SizedBox(height: 7,),
                                Text(
                                  'World Risky Areas',
                                  style: cardTextStyle,
                                )
                              ],
                            ),
                          ),
                        ),

                        InkWell(
                          onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => ReportLandslide(),
                                        ),
                                      ), 
                          child: Card(
                            shape:RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)
                            ),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SvgPicture.asset('assets/images/contact_icon.svg',
                                  height: 128,
                                ),
                                SizedBox(height: 7,),
                                Text(
                                  'Report Landslide',
                                  style: cardTextStyle,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

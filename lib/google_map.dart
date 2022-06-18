import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Googlemap extends StatefulWidget {
  @override
  GooglemapState createState() => GooglemapState();
}

class GooglemapState extends State<Googlemap> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    super.initState();
  }
    double zoomVal=5.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(FontAwesomeIcons.arrowLeft,color: Colors.black,),
            onPressed: () => Navigator.pop(context)),
        title: Text("High Risk Districts",style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white70,
      ),
      body: Stack(
        children: <Widget>[
          _buildGoogleMap(context),
          _zoomminusfunction(),
          _zoomplusfunction(),
         // _buildContainer(),
        ],
      ),
    );
  }

 Widget _zoomminusfunction() {

    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
            icon: Icon(FontAwesomeIcons.searchMinus,color:Color(0xff6200ee)),
            onPressed: () {
              zoomVal--;
             _minus( zoomVal);
            }),
    );
 }
 Widget _zoomplusfunction() {
   
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
            icon: Icon(FontAwesomeIcons.searchPlus,color:Color(0xff6200ee)),
            onPressed: () {
              zoomVal++;
              _plus(zoomVal);
            }),
    );
 }

 Future<void> _minus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(28.3949, 84.1240), zoom: zoomVal)));
  }
  Future<void> _plus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(28.3949, 84.1240), zoom: zoomVal)));
  }

  Widget _buildGoogleMap(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition:  CameraPosition(target: LatLng(28.3949, 84.1240), zoom: 6),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: {
        syanjaMarker,kaskiMarker,kathmanduMarker,baglungMarker,dhadingMarker,taplejungMarker,
        parbatMarker,palpaMarker,myagdiMarker,nuwakotMarker,rasuwaMarker,gulmiMarker,sankhuwasabaMarker,gulmiMarker,sankhuwasabaMarker,
        muguMarker,rukumMarker,dailekhMarker,surkhetMarker,dadeldhuraMarker,solukhumbuMarker,arghakhanchiMarker
        },
      ),
    );
  }

  // ignore: unused_element
  Future<void> _gotoLocation(double lat,double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(lat, long), zoom: 15,tilt: 50.0,
      bearing: 45.0,)));
  }
}

Marker syanjaMarker = Marker(
  markerId: MarkerId('Syanja'),
  position: LatLng(28.11, 83.68),
  infoWindow: InfoWindow(title: 'Syanja',snippet: 'Risk Percentage: 57.4%'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRed,
  ),
);

Marker baglungMarker = Marker(
  markerId: MarkerId('Baglung'),
  position: LatLng(28.28, 83.58),
  infoWindow: InfoWindow(title: 'Baglung', snippet: 'Risk Percentage: 61.66%'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRed,
  ),
);
Marker dhadingMarker = Marker(
  markerId: MarkerId('Dhading'),
  position: LatLng(27.97, 84.898),
  infoWindow: InfoWindow(title: 'Dhading', snippet: 'Risk Percentage: 52.93%'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRed,
  ),
);

//New York Marker

Marker gulmiMarker = Marker(
  markerId: MarkerId('Gulmi'),
  position: LatLng(28.08, 83.29),
  infoWindow: InfoWindow(title: 'Gulmi', snippet: 'Risk Percentage: 54.05%'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRed,
  ),
);
Marker kaskiMarker = Marker(
  markerId: MarkerId('Kaski'),
  position: LatLng(28.26, 84.01),
  infoWindow: InfoWindow(title: 'Kaski', snippet: 'Risk Percentage: 51.11%'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRed,
  ),
);
Marker kathmanduMarker = Marker(
  markerId: MarkerId('Kathmandu'),
  position: LatLng(27.71, 85.32),
  infoWindow: InfoWindow(title: 'Kathmandu', snippet: 'Risk Percentage: 57.56%'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRed
  ),
);
Marker taplejungMarker = Marker(
  markerId: MarkerId('Taplejung'),
  position: LatLng(27.62, 87.77),
  infoWindow: InfoWindow(title: 'Taplejung', snippet: 'Risk Percentage: 42.48%'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRed,
  ),
);
Marker myagdiMarker = Marker(
  markerId: MarkerId('Myagdi'),
  position: LatLng(28.6, 83.33),
  infoWindow: InfoWindow(title: 'Myagdi',snippet: 'Risk Percentage: 37.50%'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRed,
  ),
);
Marker nuwakotMarker = Marker(
  markerId: MarkerId('Nuwakot'),
  position: LatLng(27.88, 85.23),
  infoWindow: InfoWindow(title: 'Nuwakot', snippet: 'Risk Percentage: 54.60%'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRed,
  ),
);
Marker palpaMarker = Marker(
  markerId: MarkerId('Palpa'),
  position: LatLng(27.82, 83.63),
  infoWindow: InfoWindow(title: 'Palpa', snippet: 'Risk Percentage: 39.9%'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRed,
  ),
);
Marker parbatMarker = Marker(
  markerId: MarkerId('Parbat'),
  position: LatLng(28.22, 83.69),
  infoWindow: InfoWindow(title: 'Parbat', snippet: 'Risk Percentage: 43.64%'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRed,
  ),
);
Marker rasuwaMarker = Marker(
  markerId: MarkerId('Rasuwa'),
  position: LatLng(28.17, 85.39),
  infoWindow: InfoWindow(title: 'Rasuwa',snippet: 'Risk Percentage: 38.81%'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRed,
  ),
);
Marker sankhuwasabaMarker = Marker(
  markerId: MarkerId('Sankhuwasaba'),
  position: LatLng(27.61, 87.3),
  infoWindow: InfoWindow(title: 'Sankhuwasaba',snippet: 'Risk Percentage: 37.92%'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRed,
  ),
);
Marker solukhumbuMarker = Marker(
  markerId: MarkerId('Solukhumbu'),
  position: LatLng(27.7, 86.726),
  infoWindow: InfoWindow(title: 'Solukhumbu',snippet: 'Risk Percentage: 34.07%'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueYellow,
  ),
);
Marker muguMarker = Marker(
  markerId: MarkerId('Mugu'),
  position: LatLng(29.5, 82.1),
  infoWindow: InfoWindow(title: 'Mugu',snippet: 'Risk Percentage: 27.49%'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueYellow,
  ),
);
Marker rukumMarker = Marker(
  markerId: MarkerId('Rukum'),
  position: LatLng(28.77, 82.47),
  infoWindow: InfoWindow(title: 'Mugu',snippet: 'Risk Percentage: 27.49%'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueYellow,
  ),
);
Marker dailekhMarker = Marker(
  markerId: MarkerId('Dailekh'),
  position: LatLng(28.84, 81.71),
  infoWindow: InfoWindow(title: 'Dailekh',snippet: 'Risk Percentage: 29.03%'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueYellow,
  ),
);
Marker surkhetMarker = Marker(
  markerId: MarkerId('Surkhet'),
  position: LatLng(28.61, 81.65),
  infoWindow: InfoWindow(title: 'Surkhet',snippet: 'Risk Percentage: 18.78%'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueYellow,
  ),
);
Marker dadeldhuraMarker = Marker(
  markerId: MarkerId('Dadeldhura'),
  position: LatLng(29.3, 80.6),
  infoWindow: InfoWindow(title: 'Dadeldhura',snippet: 'Risk Percentage: 24.63%'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueYellow,
  ),
);
Marker arghakhanchiMarker = Marker(
  markerId: MarkerId('Arghakhanchi'),
  position: LatLng(27.739, 83.57),
  infoWindow: InfoWindow(title: 'Arghakhanchi',snippet: 'Risk Percentage: 15.56%'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueYellow,
  ),
);
// Note: The website https://riskyareas.z13.web.core.windows.net/ is our own wesbite whose source code could be found in the repo. 
//The website contains the map we developed to represent past data of landslide and is connected natively in the app.

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';


class PastNepalData extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
const String flutterUrl = "https://riskyareas.z13.web.core.windows.net/"; 
class _MyAppState extends State<PastNepalData> {
  late WebViewController _controller;
  // ignore: unused_element
  _loadPage() async {
    var url = await _controller.currentUrl();
    _controller.loadUrl(
      url ="https://riskyareas.z13.web.core.windows.net/",
  
    );
    print(url);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        leading: IconButton(
            icon: Icon(FontAwesomeIcons.arrowLeft,color: Colors.black,),
            onPressed: () => Navigator.pop(context)),
        title: Text("Past Landslide Data of Nepal",style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white70,
      ),
      body: SafeArea(
        child: WebView(
          key: Key("webview"),
          initialUrl: flutterUrl,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller = webViewController;
          },
        ),
      ),
    );
  }
}
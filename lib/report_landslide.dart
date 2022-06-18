import 'dart:convert';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ReportLandslide extends StatefulWidget {
  @override
  _ReportLandslideState createState() => _ReportLandslideState();
}

class _ReportLandslideState extends State<ReportLandslide> {
  final controllerTo = TextEditingController();
  final controllerDate = TextEditingController();
  final controllerLocation = TextEditingController();
  final controllerMessage = TextEditingController();
  late String resp;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        leading: IconButton(
            icon: Icon(FontAwesomeIcons.arrowLeft,color: Colors.black,),
            onPressed: () => Navigator.pop(context)),
        title: Text("Report Landslide",style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white70,
      ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              buildTextField(title: 'Reporter\'s Name', controller: controllerTo),
              SizedBox(
                height: 16,
              ),
              buildTextField(title: 'Location of Landslide', controller: controllerLocation),
              SizedBox(
                height: 16,
              ),
              buildTextField(title: 'Date Of Occurance(DD-MM-YYYY) ', controller: controllerDate),
              SizedBox(
                height: 16,
              ),
              buildTextField(
                title: 'Details on Landslide',
                controller: controllerMessage,
                maxLines: 8,
              ),
              const SizedBox(
                height: 32,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(50),
                    textStyle: TextStyle(fontSize: 20),
                  ),
                  onPressed: ()=>sendEmail(
                    name: controllerTo.text,
                    location: controllerLocation.text,
                    message: controllerMessage.text,
                    date: controllerDate.text
                  ),
                  child: Text("Send")),
                  
            ],
          ),
        ));
  }

  Future sendEmail({
    required String name,
    required String location,
    required String date,
    required String message,
  }) async {
    EasyLoading.showInfo('Sending Feedback!');
    final serviceId = 'service_4z926t8';
    final templateId = 'template_f8174xc';
    final userId = 'user_Ef0KxV91gPzLdZ7U0K7Xp';
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(
      url,
      headers: {
        'origin':'http://localhost',
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'template_params':{
          'user_name':name,
          'user_location':location,
          'user_date':date,
          'user_message':message,
        },
      }),
    );
    print(response.statusCode);
     EasyLoading.dismiss();
     if (response.statusCode == 200) 
     
     {
       _onBasicAlertPressed(context,resp='Feedback Sent Succesfully');}
     else{
       _onBasicAlertPressed(context,resp='Error Encounter, Feedback not sent!');
     }
  }

  Widget buildTextField({
    required String title,
    required TextEditingController controller,
    int maxLines = 1,
  }) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 8,
          ),
          TextField(
            maxLines: maxLines,
            controller: controller,
            decoration: InputDecoration(border: OutlineInputBorder()),
          )
        ],
      );
}
_onBasicAlertPressed(context, resp) {
  Alert(context: context, desc: resp).show();
  
  
}

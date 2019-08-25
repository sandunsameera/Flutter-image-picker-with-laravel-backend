import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
  String api = "http://10.0.2.2:8000/api/photoRetrieve";

class SecondScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return SecondScreenState();
      }
    }
    
    class SecondScreenState extends State<SecondScreen>{

      Map data;

@override
  void initState() {
    super.initState();

    this.getJsonData(context);

  }

  void getJsonData(BuildContext context) async{

    var response = await http.get(
      Uri.encodeFull(api),
      headers: {"Accept":"applicaation/json"}
    );
    print(response.body);

    setState(() {
      var convertDataToJson = json.decode(response.body);
      print("--------------------------------------------");
      print(data);
      data = convertDataToJson['data']["date"]; 
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: ListView.builder(
          itemCount: data==null?0:data.length,
          itemBuilder: (BuildContext context, int index){
            return new Container(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    new Card(
                      child: Container(
                        child: Text(data[index]['date']),
                        padding: EdgeInsets.all(20.0),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      
    );
  }
}
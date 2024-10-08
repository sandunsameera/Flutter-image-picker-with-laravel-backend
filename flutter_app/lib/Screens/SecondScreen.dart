import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/Shared.dart';
import 'package:http/http.dart'as http;
  String api = "http://10.0.2.2:8000/api/photoRetrieve";

class SecondScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return SecondScreenState();
      }
    }
    
    class SecondScreenState extends State<SecondScreen>{

       List data; 
@override
  void initState() {
    super.initState();

    this.getJsonData(context);

  }

   void getJsonData(BuildContext context) async{

    var response = await http.get(
      Uri.encodeFull(api),
      headers: {"Accept":"application/json"}
    );
      var convertJsonToData = json.decode(response.body);
    print(convertJsonToData.length.toString());

    setState(() {
      var convertJsonToData = json.decode(response.body);
      data = convertJsonToData;
    });
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen appsmnajs"),
      ),
      body: ListView.builder(
          itemCount:data.length==null? 0:data.length,
          itemBuilder: (BuildContext context, int index){
            return new Container(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10.0),
                    ),
                      new Card(
                        color: Colors.teal,
                      child: Container(  
                        child: ListTile(
                          trailing: IconButton(
                            icon: Icon(Icons.delete,color: Colors.white,),
                            onPressed: (){
                            },
                          ),
                          leading: Text(data[index]["date"]),
                          title: Text(data[index]["description"]),
                        ),
                      padding: EdgeInsets.all(10.0),
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
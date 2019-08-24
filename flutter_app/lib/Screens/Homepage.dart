import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/SecondScreen.dart';
import 'package:flutter_app/Widget/LabelTextField.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;


String apiUrl = "http://10.0.2.2:8000/api/photo";

class Homepage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomepageState();
  }
}

class HomepageState extends State<Homepage> {

  static TextEditingController _dateController = TextEditingController();
  static TextEditingController _descriptionController = TextEditingController();
  File _image;


  void create(BuildContext context) async{
    final Map<String, dynamic> data={
      'date' :_dateController.text,
      'description' : _descriptionController.text
    };
    var response = await http.post(apiUrl ,body: data,encoding: Encoding.getByName("application/json"));

    if(response.statusCode == 200){
      print("clicked");
    }

    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        label: Text("Add Camera"),
        onPressed: (){
          getImageGallery();
        },
        backgroundColor: Colors.teal,
        icon: Icon(Icons.photo_camera),
      ),
      appBar: AppBar(
        title: Text("Image picker"),
      ),
      body: SingleChildScrollView(
        child: Container(
        decoration: BoxDecoration(
          // color: Colors.orangeAccent.withOpacity(0.3)
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            LabelTextField(
              hintText: "Enter Date",
              labelText: "Date",
              textEditingController:_dateController,
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
            ),
            LabelTextField(
              hintText: "Enter little discription",
              labelText: "Description",
              textEditingController: _descriptionController,
            ),
            Padding(
              padding: EdgeInsets.all(6.0),
            ),
            Center(
              child: _image == null
                  ? ButtonTheme(
                      height: 60.0,
                      child: RaisedButton(
                        onPressed: () {
                          getImageCamera();
                        },
                        child: Text(
                          "Add photo",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  : Image.file(_image,height: 700.0,width: MediaQuery.of(context).size.width,),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            Center(
             child: RaisedButton(
               child: Icon(Icons.done),
               onPressed: (){
                 create(context);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SecondScreen()));
               },
             ),
            )
          ],
        ),
      ),

      ),    );
  }

  Future getImageGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

   Future getImageCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/Widget/LabelTextField.dart';
import 'package:image_picker/image_picker.dart';

class Homepage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomepageState();
  }
}

class HomepageState extends State<Homepage> {
  File _image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        label: Text("Add Camera"),
        onPressed: (){},
        backgroundColor: Colors.teal,
        icon: Icon(Icons.photo_camera),
      ),
      appBar: AppBar(
        title: Text("Image picker"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            LabelTextField(
              hintText: "Enter Date",
              labelText: "Date",
            ),
            LabelTextField(
              hintText: "Enter little discription",
              labelText: "Discription",
            ),
            Center(
              child: _image == null
                  ? ButtonTheme(
                      height: 150.0,
                      child: RaisedButton(
                        onPressed: () {
                          getImageGallery();
                        },
                        child: Text(
                          "Add photo",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  : Image.file(_image,height: 700.0,width: MediaQuery.of(context).size.width,),
            ),
          ],
        ),
      ),
    );
  }

  Future getImageGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }
}

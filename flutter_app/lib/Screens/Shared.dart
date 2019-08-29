import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/Widget/LabelTextField.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Shared extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return SharedState();
      }
    
    }
    
    class SharedState extends State<Shared>{

      TextEditingController controller = TextEditingController();
      String data ="";
      String nameKey="";

      @override
      void initState(){
        super.initState();

      }

      Future<bool> saveData() async {
        SharedPreferences pref = await SharedPreferences.getInstance();
        return await pref.setString(nameKey, controller.text);
      }

      Future<String>loadData() async{
        SharedPreferences pref = await SharedPreferences.getInstance();
        return pref.getString(nameKey);

      }

      setData(){
        loadData().then((value){
          setState(() {
           data = value; 
          });
        });
      }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shared preference"),
        backgroundColor: Colors.teal,
      ),
      body:Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 16.0,),
              LabelTextField(
        textEditingController: controller,
        hintText: "Name",
        labelText: "Name",
      ),
      SizedBox(height: 50.0,),
      RaisedButton(
        onPressed: (){saveData();},
        child: Text("Save data"),
        color: Colors.white,
      ),
      SizedBox(height:50.0),
      Text(data,
      style: TextStyle(
        fontSize: 20.0
      ),),
      SizedBox(height:50.0),
       RaisedButton(
        onPressed: (){
          setData();
          },
        
        child: Text("Load data"),
        color: Colors.white,
      ),
          ],
        ),
      )
    );
  }
}
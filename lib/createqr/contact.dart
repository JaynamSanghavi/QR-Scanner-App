import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:qrcode/createqr/generateqr.dart';

class ContactQR extends StatefulWidget {
  
  @override
  _ContactQRState createState() => _ContactQRState();
}

class _ContactQRState extends State<ContactQR> {
  TextEditingController contactController = TextEditingController();

  void _showDialog(String alertitle,String alertbody){
    showDialog(
      context: context,
      builder: (BuildContext context) => new CupertinoAlertDialog(
        title: new Text(alertitle),
        content: new Text(alertbody),
        actions: [
          CupertinoDialogAction(
              isDefaultAction: true,
              child: new FlatButton(
                child: new Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        margin: EdgeInsets.all(05.0),
        padding: EdgeInsets.all(10.0),

        child: ListView(
          children: <Widget>[
            new FormField("Contact Number", TextInputType.phone,contactController),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child:Icon(Icons.add,color: Colors.black),
        backgroundColor: Color.fromARGB(255,124,205,66),
        onPressed:(){
          var number = contactController.text;
          if(number.length < 10){
            _showDialog("Contact Number error", "The number you provided is less than 10 digit");
          }else{
            Navigator.push(context,MaterialPageRoute(builder: (context) => GenerateScreen(number)));
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class FormField extends StatefulWidget {
  final String formFieldname;
  final TextInputType keyboardType;
  final TextEditingController controller;
  FormField(this.formFieldname, this.keyboardType, this.controller);
  _FormFieldState createState() => _FormFieldState();
}

class _FormFieldState extends State<FormField> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: TextField(
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(
            labelText: widget.formFieldname,
            labelStyle: TextStyle(fontSize: 18.0),
            fillColor: Color.fromARGB(255,85,139,47),
            border: new OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: new BorderSide(),
            ),
          ),
          style: TextStyle(
            fontFamily: "Poppins",
            fontSize: 20.0,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
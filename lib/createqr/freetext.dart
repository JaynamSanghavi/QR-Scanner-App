import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qrcode/createqr/generateqr.dart';

class FreeTextQR extends StatefulWidget {
  @override
  _FreeTextQRState createState() => _FreeTextQRState();
}

class _FreeTextQRState extends State<FreeTextQR> {
  TextEditingController textController = TextEditingController();

  void _showDialog(String alertitle,String alertbody){
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(alertitle),
          content: new Text(alertbody),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
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
              new FormField("Free Text", TextInputType.multiline,textController),
            ],
          ),
        ),
      floatingActionButton: FloatingActionButton(
        child:Icon(Icons.add,color: Colors.black),
        backgroundColor: Color.fromARGB(255,124,205,66),
        onPressed:(){
          var text = textController.text;
          if(text.length > 0) {
            Navigator.push(context,MaterialPageRoute(builder: (context) => GenerateScreen(text)));
          }else{
            _showDialog("Free Text Error", "The text you provided should have minimum one character");
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
import 'package:flutter/material.dart';
import 'package:qrcode/home.dart';


class Result extends StatelessWidget {
  final String result;

  Result(this.result);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Result",style: new TextStyle(color:Colors.white)),
        backgroundColor: Color.fromARGB(255,85,139,47) ,
      ),
      body: Center(
        child: new Text("$result",
          style: new TextStyle(fontSize: 20.0,fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}

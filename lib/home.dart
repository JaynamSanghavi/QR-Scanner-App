import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qrcode/createqr/homepagecreate.dart';
import 'package:qrcode/scanqr/scan.dart';

class HomePage extends StatefulWidget {

  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {

  String result = "Result will be display";
   Future scanQR() async{
    try{
      String qrResult = await BarcodeScanner.scan();
      print(qrResult);
      Navigator.push(context,MaterialPageRoute(builder: (context) => Result(qrResult)));

    }on PlatformException catch(e){
      if(e.code == BarcodeScanner.CameraAccessDenied){
        result = "CAMERA PERMISION WAS DENIED";
        print(result);
        Navigator.push(context,MaterialPageRoute(builder: (context) => Result(result)));
      }else{
        result = "UNKOWN ERROR $e";
        print(result);
        Navigator.push(context,MaterialPageRoute(builder: (context) => Result(result)));
      }
    }on FormatException{
      result = "PRESSED BACK BUTTON BEFORE SCANNING ANYTING";
      print(result);
      new Result(result);
    }catch(e){
      result = "UNKOWN ERROR $e";
      print(result);
      Navigator.push(context,MaterialPageRoute(builder: (context) => Result(result)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: new AppBar(
        title: new Text("QR SCANNER And Generation",style: new TextStyle(color:Colors.white)),
        backgroundColor: Color.fromARGB(255,85,139,47) ,
      ),
      
      floatingActionButton:Column(
        crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FloatingActionButton.extended(
            heroTag: null,
            icon: Icon(Icons.camera_alt,color: Colors.black),
            label: Text("Scan",style: new TextStyle(color:Colors.black)),
            backgroundColor: Color.fromARGB(255,124,205,66),
            onPressed:() => scanQR(),
          ),
          new Padding(
            padding: const EdgeInsets.all(20.0),
          ),
          FloatingActionButton.extended(
            heroTag: null,
            icon: Icon(Icons.add_box,color: Colors.black),
            label: Text("Create",style: new TextStyle(color:Colors.black)),
            backgroundColor: Color.fromARGB(255,124,205,66),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => CreatePage()));
            },
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      
    );
  }
}

import 'package:flutter/material.dart';
import 'package:qrcode/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QR SCANNER And Creation',
      home: HomePage(),
    );
  }
}



import 'package:flutter/material.dart';
import 'contact.dart';
import 'freetext.dart';

class CreatePage extends StatefulWidget {

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    FreeTextQR(),
    ContactQR(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Create"),
        backgroundColor: Color.fromARGB(255,85,139,47),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Color.fromARGB(255,85,139,47),
        onTap: onTabTapped, // new
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.textsms),
            title: new Text('Free Text'),
            backgroundColor: Color.fromARGB(255,85,139,47),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.phone),
            title: new Text('Contact Number'),
            backgroundColor: Color.fromARGB(255,85,139,47),
          ),

        ],
      ),

    );
  }
}



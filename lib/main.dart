import 'package:flutter/material.dart';
import 'home_page.dart';

void main()=>runApp(new MyChatApp());

class MyChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      title: "Chat App",
      home: new HomePage(),
    );
  }
}

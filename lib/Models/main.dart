import 'package:flutter/material.dart';
import 'package:practice_chat_app/MessageScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.lightBlueAccent,
        //accentColor: Col
      ),
    home: MessageScreen(),
    );

  }
}

import 'package:flutter/material.dart';
import 'package:loginscreenblock/src/screens/loginscreen.dart';

class App extends StatelessWidget {

  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Login screen'),
        ),
        body: LoginScreen(),
      ),
    );
  }
}

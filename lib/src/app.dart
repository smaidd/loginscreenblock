import 'package:flutter/material.dart';
import 'screens/loginscreen.dart';
import 'blocs/provider.dart';

class App extends State<AppState> {
  Widget build(context) {
    return Scaffold(
      body: emailLoginButton(),
    );
  }

  Widget emailLoginButton() {
    return Scaffold(
      body: RaisedButton(
        child: Text('Login /w email'),
        color: Colors.purple,
        onPressed:moveToLoginWithEmail
      ),
    );
  }

  void moveToLoginWithEmail()  {
     Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}

class AppState extends StatefulWidget {
  @override
  App createState() => App();
}

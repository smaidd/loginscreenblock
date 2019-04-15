import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          emailField(),
          passwordField(),
          Container(
            margin: EdgeInsets.all(20.0),
          ),
          buttonField(),
        ],
      ),
    );
  }

  Widget emailField() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Email',
      ),
    );
  }

  Widget passwordField() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Password',
      ),
    );
  }

  Widget buttonField() {
    return RaisedButton(
      color: Colors.deepOrange,
      child: Text('Submit'),
      onPressed: (){},
    );
  }
}

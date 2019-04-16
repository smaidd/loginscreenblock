import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Office Manager'),
      ),
      //margin: EdgeInsets.all(20.0),
      body: Column(
        children: <Widget>[
          emailField(),
          passwordField(),
          Align(
            alignment: Alignment.center,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                buttonSignIn(),
                Padding(
                  padding: EdgeInsets.all(45.0),
                ),
                buttonSignUp(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget emailField() {
    return StreamBuilder(
      stream: bloc.buildEmailStream,
      builder: (context, snapsht) {
        return TextField(
          controller: _emailController,
          onChanged: (email) {
            bloc.validateEmail(email);
          },
          decoration: InputDecoration(
            labelText: 'Email',
            errorText: snapsht.error,
          ),
        );
      },
    );
  }

  Widget passwordField() {
    return StreamBuilder(
      stream: bloc.buildPasswordStream,
      builder: (context, snapshot) {
        return TextField(
          obscureText: true,
          controller: _passwordController,
          onChanged: (password) {
            bloc.validatePassword(password);
          },
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            labelText: 'Password',
            errorText: snapshot.error,
          ),
        );
      },
    );
  }

  Widget buttonSignIn() {
    return StreamBuilder(
      stream: bloc.submitValue,
      builder: (context, snapshot) {
        return Container(
          margin: EdgeInsets.only(top: 20.0),
          width: 125.0,
          height: 35.0,
          child: RaisedButton(
              child: Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w500,
                ),
              ),
              elevation: 4.0,
              splashColor: Colors.red,
              color: Colors.deepOrange,
              onPressed: snapshot.hasError ? null : signInUserAndPassword),
        );
      },
    );
  }

  Widget buttonSignUp() {
    return StreamBuilder(
      stream: bloc.submitValue,
      builder: (context, snapshot) {
        return Container(
          margin: EdgeInsets.only(top: 20.0),
          width: 125.0,
          height: 35.0,
          child: RaisedButton(
              child: Text('Sign Up'),
              elevation: 4.0,
              splashColor: Colors.red,
              color: Colors.deepOrange,
              onPressed: snapshot.hasError ? null : signUpUserAndPassword),
        );
      },
    );
  }

  void signInUserAndPassword() async {
    try {
      FirebaseUser user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text);
      print('login succes');
    } catch (e) {
      print('login esuat');
    }
  }

  void signUpUserAndPassword() async {
    try {
      FirebaseUser user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text);
      print('login succes');
    } catch (e) {
      print('user exista');
    }
  }

  void show(BuildContext context) {
    showDialog(
        context: context,
        builder: (x) {
          return new SimpleDialog(children: <Widget>[
            new Center(child: new Container(child: new Text('foo')))
          ]);
        });
  }
}

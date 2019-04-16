import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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
        return RaisedButton(
            elevation: 4.0,
            splashColor: Colors.red,
            color: Colors.deepOrange,
            child: Text('Sign In'),
            onPressed: snapshot.hasError ? null : signInUserAndPassword);
      },
    );
  }

  Widget buttonSignUp() {
    return StreamBuilder(
      stream: bloc.submitValue,
      builder: (context, snapshot) {
        return RaisedButton(
            color: Colors.deepOrange,
            child: Text('Sign Up'),
            onPressed: snapshot.hasError ? null : signUpUserAndPassword);
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
      print('User exista');
    }
  }
}

import 'dart:async';
import '../validators/validators.dart';
import 'package:rxdart/rxdart.dart';

class Block extends Validators {
  final _emailController = StreamController<String>.broadcast();
  final _passController = StreamController<String>.broadcast();

  //Retrieve data from stream
  Stream<String> get buildEmailStream =>
      _emailController.stream.transform(emailValidator);

  Stream<String> get buildPasswordStream =>
      _passController.stream.transform(passwordValidator);

  Stream<bool> get submitValue => Observable.combineLatest2(
      buildEmailStream, buildPasswordStream, (e, p) => true);

  //Add data to stream
  Function(String) get validateEmail => _emailController.sink.add;

  Function(String) get validatePassword => _passController.sink.add;

  dispose() {
    _emailController.close();
    _passController.close();
  }
}

final bloc = Block();

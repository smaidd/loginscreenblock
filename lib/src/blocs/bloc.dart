import 'dart:async';
import '../validators/validators.dart';

class Block extends Validators{
  final _emailController = StreamController<String>();
  final _passController = StreamController<String>();

  //Retrieve data from stream
  Stream<String> get email => _emailController.stream.transform(emailValidator);
  Stream<String> get password => _passController.stream.transform(passwordValidator);

  //Add data to stream
  Function(String) get addEmailData => _emailController.sink.add;
  Function(String) get addPassword => _passController.sink.add;



}


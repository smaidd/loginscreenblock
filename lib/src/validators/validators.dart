import 'dart:async';

class Validators {
  final emailValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink) {
      if (email.endsWith('@trencadis.ro')) {
        sink.add(email);
      } else {
        sink.addError('Enter a valid email');
      }
    },
  );
  final passwordValidator = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
        if (password.length > 3) {
          sink.add(password);
        } else {
          sink.addError('Password must be at least 3 caracter');
        }
      }
  );
}

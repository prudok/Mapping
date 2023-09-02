import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

/// ErrorHandler class is used to send all types of errors caught in main zone
/// to analytics
@Singleton()
class ErrorHandler {
  Future<void> send(Object error, StackTrace? stackTrace) async {
    if (kDebugMode) {
      print('----- Something went wrong. -----');
      print(error);
      print(stackTrace);
    } else {
      Future<void>.delayed(const Duration(milliseconds: 200), () {
        return;
      });
    }
  }
}

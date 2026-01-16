
import 'package:flutter/cupertino.dart';

class Logger {
  static void log(String message) {
    debugPrint("[App] $message");
  }
}
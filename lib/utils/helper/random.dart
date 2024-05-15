// ignore_for_file: camel_case_types

import 'dart:math';
import 'package:intl/intl.dart';

class randomNumber {
  String? ranNumber;

  String fucRandomNumber() {
    var rng = Random();
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyyMMddHHmmss').format(now);
    String value = formattedDate + rng.nextInt(999999).toString();
    return value;
  }

  String fucRandomNumberBank() {
    var rng = Random();
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyMMddHHmmss').format(now);
    String value = formattedDate + rng.nextInt(9999).toString();
    return value;
  }
}

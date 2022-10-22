import 'package:intl/intl.dart';

// ignore: public_member_api_docs
extension StringExtension on String {
  // ignore: public_member_api_docs
  DateTime stringToDateTimeObject() {
    return DateFormat('dd/MM/yyyy').parse(this);
  }
}

// ignore: public_member_api_docs
extension NumberExtension on num {
  String secondsToMinutesAndSeconds() {
    int minutesLeft = (this / 60).floor();
    int sec = this.toInt() % 60;
    int min = (this / 60).floor();
    String minute =
        min.toString().length <= 1 ? "0$minutesLeft" : "$minutesLeft";
    String second = sec.toString().length <= 1 ? "0$sec" : "$sec";
    return "$minute:$second";
  }
}

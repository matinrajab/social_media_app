import 'package:cloud_firestore/cloud_firestore.dart';

String dateFormatter(Timestamp timestamp) {
  DateTime dateTime = timestamp.toDate();
  String year = dateTime.year.toString();
  String month = dateTime.month.toString();
  String day = dateTime.day.toString();
  String formattedDate = '$day/$month/$year';

  return formattedDate;
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DataFormat {
  static const idCurrencySymbol = 'Rp';
  static const squareMeterSymbol = 'm²';
  static const cubicMeterSymbol = 'm³';
  static const durationShort = Duration(seconds: 3);
  static final idCurrencyFormat = NumberFormat('Rp#,##0', 'id_ID');
  static final idThousandFormat = NumberFormat('#,##0', 'id_ID');
  static final longDateFormat = DateFormat('dd-MMM-yyyy HH:mm:ss');
  static final readableFullDateFormat = DateFormat('dd MMMM yyyy');
  static final monthOnlyDateFormat = DateFormat('MMM');
  static final monthOnlyDateFormatLong = DateFormat('MMMM');
  static final monthYearOnlyFormat = DateFormat('MMMM yyyy');
  static final sqliteDateFormat = DateFormat('yyyy-MM-dd');
  static const dateOnlyFormat = 'dd MMM yyyy';

  static DateTime get today => DateTime.now();
  static int get currentYear => today.year;
  static int get currentMonth => today.month;
  static int get currentTimeStamp => (today.millisecondsSinceEpoch ~/ 1000);

  static List<Color> get colorSeeds => [
        Colors.red,
        Colors.green,
        Colors.blue,
        Colors.amber,
        Colors.purple,
        Colors.pink,
        Colors.lightBlue,
        Colors.lime,
        Colors.orange,
        Colors.brown,
        Colors.cyan,
        Colors.teal,
        Colors.redAccent,
        Colors.deepOrange,
        Colors.deepPurple,
        Colors.pink,
        Colors.grey,
        Colors.indigo,
        Colors.indigoAccent,
      ];
}

import 'package:intl/intl.dart';

extension UnixExtension on int {
  static const dateOnlyFormat = 'dd-MMM-yyyy';
  static const timeOnlyFormat = 'HH:mm:ss';
  static const dateTimeFormat = '$dateOnlyFormat $timeOnlyFormat';

  String get onDateTimeFormat {
    var eventTime = DateTime.fromMillisecondsSinceEpoch(this);
    var formated = DateFormat(dateTimeFormat).format(eventTime);
    return '$formated ${eventTime.timeZoneName}';
  }

  String get onDateFormat {
    var eventTime = DateTime.fromMillisecondsSinceEpoch(this * 1000);
    var formated = DateFormat(dateOnlyFormat).format(eventTime);
    return '$formated ${eventTime.timeZoneName}';
  }

  String get secondToTime {
    int seconds = (this % 3600).truncate();
    int minutes = (seconds / 60).truncate();
    int hours = (this / 3600).truncate();

    String hoursStr = (hours).toString();
    String minutesStr = (minutes).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');

    if (hours == 0) {
      return "00:$minutesStr:$secondsStr";
    }

    if (minutes == 0) {
      return "00:00:$secondsStr";
    }

    if (seconds == 0) {
      return "00:00:00";
    }

    return "$hoursStr:$minutesStr:$secondsStr";
  }
}

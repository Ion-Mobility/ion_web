extension DurationExtension on Duration? {
  String get inCountdownMinute {
    var seconds = inHourSeconds;
    var minutes = (seconds / 60).truncate();
    return (minutes < 10) ? '0$minutes' : '$minutes';
  }

  String get inCountdownSecond {
    var seconds = inHourSeconds;
    var rounded = (seconds % 60).truncate();
    return (rounded < 10) ? '0$rounded' : '$rounded';
  }

  /// This extension is needed to be supplied with seconds
  int get inHourSeconds {
    var seconds = this;
    if (seconds != null) {
      var rounded = (seconds.inSeconds % 3600).truncate();
      return rounded;
    }
    return 0;
  }
}

import 'package:intl/intl.dart';

extension DateExtension on DateTime? {
  String? tryFormat(DateFormat format) {
    if (this != null) {
      return format.format(this!);
    }
    return null;
  }
}

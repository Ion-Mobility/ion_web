import 'package:intl/intl.dart';

import '../consts/data_format.dart';

extension RawDateExtension on String? {
  String? get readableDate {
    if (this != null) {
      final date = DataFormat.sqliteDateFormat.parse(this!);
      final formatted = DateFormat(DataFormat.dateOnlyFormat).format(date);
      return formatted;
    }
    return null;
  }
}

import 'package:ion_core/ion_core.dart';

import '../consts/data_format.dart';

extension StringNullableExtension on String? {
  String? get stringNumberToFullMonth {
    final value = this;
    if (value != null) {
      final dt = DateTime(0, int.parse(value));
      return (value.length <= 2)
          ? DataFormat.monthOnlyDateFormat.format(dt)
          : value;
    }
    return null;
  }

  String? capitalize() {
    final text = this;
    if (text != null) {
      return "${text[0].toUpperCase()}${text.substring(1).toLowerCase()}";
    }
    return null;
  }

  String get sanitized {
    final text = this;
    if (text != null && text.isNotBlank) {
      return "${text[0].toUpperCase()}${text.substring(1).toLowerCase()}";
    }
    return 'N/A';
  }

  String? get formatedDate {
    if (this != null) {
      final date = DateTime.parse(this!);
      final formated = DataFormat.longDateFormat.format(date);
      return formated;
    }
    return null;
  }

  String? get unEscape {
    final value = this;
    if (value != null) {
      return value.replaceAll(r'\n', '');
    }
    return null;
  }
}

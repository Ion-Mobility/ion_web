import '../consts/data_format.dart';

extension NumericIntExtension on int {
  String get thousandFormat {
    var value = this;
    return DataFormat.idThousandFormat.format(value);
  }
}

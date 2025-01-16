import '../consts/data_format.dart';

extension NumericNullableDoubleExtension on double? {
  String get formatedPriceShort {
    var amount = this?.toStringAsFixed(0) ?? '';
    if (amount.length > 6) {
      final prime = amount.substring(0, amount.length - 6);
      final decimal = amount.substring(amount.length - 6, amount.length - 5);
      final result = (decimal != '0') ? '$prime,$decimal jt' : '$prime jt';
      return result;
    } else if (amount.length > 3) {
      final prime = amount.substring(0, amount.length - 3);
      return '$prime rb';
    } else {
      return amount;
    }
  }

  String get thousandFormat {
    var value = this ?? 0;
    return DataFormat.idThousandFormat.format(value);
  }
}

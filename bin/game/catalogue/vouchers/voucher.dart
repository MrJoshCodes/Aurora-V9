import 'voucher_type.dart';

class Voucher {
  String _code;
  int _value;
  VoucherType _type;

  Voucher(Map<dynamic, dynamic> row) {
    _code = row['code'];
    _value = row['value'];
    _type = VoucherType.parse(row['type'].toString().toUpperCase());
  }

  String get Code {
    return _code;
  }

  int get Value {
    return _value;
  }

  VoucherType get Type {
    return _type;
  }
}
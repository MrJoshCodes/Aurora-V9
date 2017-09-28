import '../../../engine.dart';
import 'package:postgresql/postgresql.dart';
import 'voucher.dart';

class VoucherManager {
  Map<String, Voucher> _vouchers;

  VoucherManager() {
    _vouchers = new Map();

    refreshVouchers();
  }

  void refreshVouchers() {
    _vouchers.clear();

    Engine.Database.getConnection().then((conn) {
      conn.setQuery('SELECT * FROM vouchers');
      conn.getResultSet().then((rows) {
        for (Row row in rows) {
          Voucher voucher = new Voucher(row.toMap());
          _vouchers.putIfAbsent(voucher.Code, () => voucher);
        }

        Engine.Log.write('CACHE', 'Loaded {0} vouchers.', [_vouchers.length]);
        conn.dispose();
      });
    });
  }

  Voucher tryGetVoucher(String code) {
    if (_vouchers.containsKey(code)) {
      return _vouchers[code];
    }

    return null;
  }

  void consumeVoucher(String voucher) {
    _vouchers.remove(voucher);

    Engine.Database.getConnection().then((conn) {
      conn.addParameter('code', voucher);
      conn.setQuery('DELETE FROM vouchers WHERE code = @code');
      conn.execute();
    });
  }
}
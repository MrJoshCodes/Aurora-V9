import 'vouchers/voucher_manager.dart';

class CatalogueManager {
  
  VoucherManager _voucherManager;

  VoucherManager get Vouchers {
    return _voucherManager;
  }

  CatalogueManager() {
    _voucherManager = new VoucherManager();
  }  
}
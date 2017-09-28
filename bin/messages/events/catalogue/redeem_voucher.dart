import '../../../engine.dart';
import '../../../game/catalogue/vouchers/voucher.dart';
import '../../../game/catalogue/vouchers/voucher_type.dart';
import '../../../game/sessions/session.dart';
import '../../composers/catalogue/redeem_voucher_error.dart';
import '../../composers/catalogue/redeem_voucher_ok.dart';
import '../../composers/users/wallet_balance.dart';
import '../../message_event.dart';
import 'dart:async';
import '../../types/client_message.dart';

class RedeemVoucherEvent implements IMessageEvent {

  @override
  Future run(Session session, ClientMessage message) async {
    if (session.Player == null) return;

    String input = message.readString().replaceAll('/\'/g', '').trim();

    Voucher voucher = Engine.HabboHotel.Catalogue.Vouchers.tryGetVoucher(input);

    if (voucher == null) {
      session.sendMessage(new RedeemVoucherErrorComposer());
    } else {
      if (voucher.Type == VoucherType.CREDITS) {
        session.Player.Coins += voucher.Value;

        session.queueMessage(new WalletBalanceComposer(session.Player.Coins)); 
      }

        session.queueMessage(new RedeemVoucherOkComposer());
        session.flush();

        Engine.HabboHotel.Catalogue.Vouchers.consumeVoucher(input);
    }
  }
}
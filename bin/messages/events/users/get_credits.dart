import '../../../game/sessions/session.dart';
import '../../composers/users/wallet_balance.dart';
import '../../message_event.dart';
import 'dart:async';
import '../../types/client_message.dart';

class GetCreditsEvent implements IMessageEvent {

  @override
  Future run(Session session, ClientMessage message) async {
    if (session.Player == null) return;

    session.sendMessage(new WalletBalanceComposer(session.Player.Coins));
  }
}
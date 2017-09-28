import '../game/sessions/session.dart';
import 'dart:async';
import 'events/catalogue/redeem_voucher.dart';
import 'events/handshake/generate_key.dart';
import 'events/handshake/info_retrieve.dart';
import 'events/handshake/try_login.dart';
import 'events/users/get_available_sets.dart';
import 'events/users/get_credits.dart';
import 'events/users/update.dart';
import 'events/users/update_account.dart';
import 'message_event.dart';
import 'types/client_message.dart';

class MessageHelper {
  Map<int, IMessageEvent> _messageEvents;

  MessageHelper() {
    _messageEvents = new Map();

    _registerHandshake();
    _registerUsers();
    _registerCatalogue();
  }

  void _registerHandshake() {
    _messageEvents[4] = new TryLoginEvent();
    _messageEvents[7] = new InfoRetrieveEvent();
  }

  void _registerUsers() {
    _messageEvents[8] = new GetCreditsEvent();
    _messageEvents[9] = new GetAvailableSetsEvent();
    _messageEvents[44] = new UpdateEvent();
    _messageEvents[149] = new UpdateAccountEvent();
    _messageEvents[202] = new GenerateKeyEvent();
  }

  void _registerCatalogue() {
    _messageEvents[129] = new RedeemVoucherEvent();
  }

  Future tryHandle(Session session, String packet) async {
    ClientMessage message = new ClientMessage(packet);

    if (_messageEvents.containsKey(message.Header)) {
      await _messageEvents[message.Header].run(session, message);
    }
  }
}
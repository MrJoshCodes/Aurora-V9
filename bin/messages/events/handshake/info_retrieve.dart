import '../../../game/sessions/session.dart';
import '../../composers/handshake/user_object.dart';
import '../../message_event.dart';
import 'dart:async';
import '../../types/client_message.dart';

class InfoRetrieveEvent implements IMessageEvent {

  @override
  Future run(Session session, ClientMessage message) async {
    if (session.Player == null) return;

    session.sendMessage(new UserObjectComposer(session.Player));
  }
}
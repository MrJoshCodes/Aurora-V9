import '../../../game/sessions/session.dart';
import '../../message_event.dart';
import '../../types/client_message.dart';
import 'dart:async';

class TryLoginEvent implements IMessageEvent {

  @override
  Future run(Session session, ClientMessage message) async {
    String username = message.readString();
    String password = message.readString();
    
    session.tryLogin(username, password);
  }
}
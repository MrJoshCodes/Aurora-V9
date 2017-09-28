import '../game/sessions/session.dart';
import 'dart:async';
import 'types/client_message.dart';

abstract class IMessageEvent {
  Future run(Session session, ClientMessage message);
}
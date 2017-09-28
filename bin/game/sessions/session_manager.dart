import 'dart:io';
import 'session.dart';

class SessionManager {
  int _sessionId;
  Map<int, Session> _sessions;

  SessionManager() {
    _sessions = new Map();
    _sessionId = 0;
  }

  Session addSession(Socket client) {
    Session session = new Session(_sessionId++, client);
    _sessions.putIfAbsent(_sessionId, () => session);
    return session;
  }

  void removeSession(Session session) {
    _sessions.remove(session.Id);
  }
}
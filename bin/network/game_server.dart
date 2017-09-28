import '../engine.dart';
import '../game/sessions/session.dart';
import 'dart:async';
import 'dart:io';

class GameServer {
  ServerSocket _socketFuture;

  Future start(int port) async {
    _socketFuture = await ServerSocket.bind('0.0.0.0', port);
    await _socketFuture.listen(onNewConnectionArrival);

    Engine.Log.write('BOOT', 'Started GameServer on port {0}.', [port]);
  }

  void onNewConnectionArrival(Socket client) {
    Session session = Engine.HabboHotel.Sessions.addSession(client);
    
    session.startReceiving();
  }
}
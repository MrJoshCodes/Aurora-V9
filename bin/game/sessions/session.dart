import '../../engine.dart';
import '../../messages/composers/handshake/authentication_ok.dart';
import '../../messages/composers/handshake/error.dart';
import '../../messages/composers/handshake/hello_composer.dart';
import '../../messages/composers/misc/system_broadcast.dart';
import '../../messages/types/server_message.dart';
import '../../utilities/base64_encoding.dart';
import '../../utilities/string_utils.dart';
import '../habbos/habbo.dart';
import 'dart:async';
import 'dart:io';
import 'dart:core';

class Session {
  int _id;
  Socket _client;
  Habbo _habbo;

  int get Id {
    return _id;
  }

  Habbo get Player {
    return _habbo;
  }

  Session(int id, Socket client) {
    _id = id;
    _client = client;

    sendMessage(new HelloComposer());

    Engine.Log.write(_id, 'New connection from {0}.', [_client.remoteAddress.address]);
  }

  void queueMessage(ServerMessage message) {
    Engine.Log.write(_id, '< {0}.', [message]);

    _client.write(message.getPacket());
  }

  void sendMessage(ServerMessage message) {
    _client.write(message.getPacket());
    _client.flush();
  }

  void sendRaw(String data) {
    _client.write(data + new String.fromCharCode(1));
    _client.flush();
  }

  void flush() {
    _client.flush();
  }

  void startReceiving() {
    _client.listen(_onDataArrival, onDone: onDisconnect);
  }

  Future onDisconnect() async {
    if (Player != null) {
      await Player.Update();
    }

    Engine.Log.write(_id, 'Dropped connection from {0}.', [_client.remoteAddress.address]);
  }

  Future _onDataArrival(List<int> data) async {
    String raw = new String.fromCharCodes(data);

    while (raw.length >= 5) {
      int length = Base64Encoding.decodeInt(StringUtils.substring(raw, 0, 3));
      String packet = StringUtils.substring(raw, 3, length);
      raw = raw.substring(3 + length);

      Engine.Log.write(_id, '> {0}.', [packet]);

      await Engine.Messages.tryHandle(this, packet);
    }
  }

  Future tryLogin(String username, String password) async {
    Habbo habbo = await Engine.HabboHotel.Habbos.getHabboByName(username);

    if (habbo != null) {
      if (habbo.Password == password) {
        _habbo = habbo;

        Engine.Log.write(_id, '{0} logged in.', [username]);

        queueMessage(new AuthenticationOkComposer());
        queueMessage(new SystemBroadcastComposer('Welcome to HabboDart'));
        flush();
        return;
      }
    }

    sendMessage(new ErrorComposer('login incorrect: Wrong username/password'));
  }
}
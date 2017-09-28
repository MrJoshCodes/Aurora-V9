import '../../types/server_message.dart';

class SystemBroadcastComposer extends ServerMessage {
  SystemBroadcastComposer(String message) : super(139) {
    appendStringWithBreak(message);
  }

}
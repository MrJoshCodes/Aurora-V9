import '../../types/server_message.dart';

class ErrorComposer extends ServerMessage {
  ErrorComposer(String message) : super(33) {
    appendStringWithBreak(message);
  }

}
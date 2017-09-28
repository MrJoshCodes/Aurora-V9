import '../../types/server_message.dart';

class SessionParamsComposer extends ServerMessage {

  SessionParamsComposer() : super(257) {
    appendVL64(6);
    appendVL64(0);
    appendVL64(1);
    appendVL64(1);
    appendVL64(1);
    appendVL64(3);
    appendVL64(0);
    appendVL64(2);
    appendVL64(1);
    appendVL64(4);
    appendVL64(1);
    appendVL64(5);
    appendStringWithBreak('dd-MM-yyyy');
  }

}
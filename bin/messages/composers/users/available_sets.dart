import '../../types/server_message.dart';

class AvailableSetsComposer extends ServerMessage {
  AvailableSetsComposer(String sets) : super(8) {
    appendStringWithBreak(sets);
  }

}
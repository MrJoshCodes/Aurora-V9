import '../../types/server_message.dart';

class UpdateAccountComposer extends ServerMessage {
  UpdateAccountComposer(int error) : super(169) {
    appendString(error);
  }

}
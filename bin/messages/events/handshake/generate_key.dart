import '../../../game/sessions/session.dart';
import '../../../utilities/constants.dart';
import '../../composers/handshake/session_params.dart';
import '../../composers/users/available_sets.dart';
import '../../message_event.dart';
import '../../types/client_message.dart';
import 'dart:async';

class GenerateKeyEvent implements IMessageEvent {

  @override
  Future run(Session session, ClientMessage message) async {
    // TODO: Encryption?

    session.queueMessage(new SessionParamsComposer());
    session.queueMessage(new AvailableSetsComposer(Constants.AVAILABLE_SETS));

    session.flush();
  }
}
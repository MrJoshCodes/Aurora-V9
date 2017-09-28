import '../../../game/sessions/session.dart';
import '../../../utilities/constants.dart';
import '../../composers/users/available_sets.dart';
import '../../message_event.dart';
import 'dart:async';
import '../../types/client_message.dart';

class GetAvailableSetsEvent implements IMessageEvent {

  @override
  Future run(Session session, ClientMessage message) async {
    session.sendMessage(new AvailableSetsComposer(Constants.AVAILABLE_SETS));
  }
}
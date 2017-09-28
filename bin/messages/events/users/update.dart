import '../../../game/sessions/session.dart';
import '../../../utilities/user_properties_decoder.dart';
import '../../composers/handshake/user_object.dart';
import '../../message_event.dart';
import 'dart:async';
import '../../types/client_message.dart';

class UpdateEvent implements IMessageEvent {

  @override
  Future run(Session session, ClientMessage message) async {
    if (session.Player == null) return;

    UserPropertiesDecoder userPropertiesDecoder = new UserPropertiesDecoder(message);

    String figure = userPropertiesDecoder[4];
    String gender = userPropertiesDecoder[5];
    String motto = userPropertiesDecoder[6];

    bool newFigure = figure != null && figure.isNotEmpty;
    bool newGender = gender != null && gender.isNotEmpty;
    bool newMotto = motto != null && motto.isNotEmpty;

    List<String> columns = [];
    List<String> values = [];

    if (newFigure) {
      session.Player.Figure = figure;
      columns.add('figure');
      values.add(figure);
    } 

    if (newGender) {
      session.Player.Gender = gender;
      columns.add('gender');
      values.add(gender);
    }

    if (newMotto) {
      session.Player.Motto = motto;
      columns.add('motto');
      values.add(motto);
    }

    session.sendMessage(new UserObjectComposer(session.Player));
  }
}
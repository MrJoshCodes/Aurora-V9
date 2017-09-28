import '../../../game/sessions/session.dart';
import '../../../utilities/user_properties_decoder.dart';
import '../../composers/users/update_account.dart';
import '../../message_event.dart';
import 'dart:async';
import '../../types/client_message.dart';

class UpdateAccountEvent implements IMessageEvent {

  @override
  Future run(Session session, ClientMessage message) async {
    if (session.Player == null) return;

    UserPropertiesDecoder decoder = new UserPropertiesDecoder(message);
    
    String password = decoder[13];
    String dob = decoder[8];
    String newPassword = decoder[3];
    String email = decoder[7];

    int error = 0;

    if (password.isEmpty || password != session.Player.Password) {
      error = 1;
    } else if (dob.isEmpty) {
      error = 2;
    } else {
      if (newPassword.isNotEmpty) {
        session.Player.Password = newPassword;
      } else if (email.isNotEmpty) {
        session.Player.Email = email;  
      }
    }

    session.sendMessage(new UpdateAccountComposer(error));
  }
}
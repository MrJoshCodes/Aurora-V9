import '../../../game/habbos/habbo.dart';
import '../../types/server_message.dart';

class UserObjectComposer extends ServerMessage {
  UserObjectComposer(Habbo habbo) : super(5) {
    appendStringWithBreak('name=' + habbo.Username, 13);
    appendStringWithBreak('figure=' + habbo.Figure, 13);
    appendStringWithBreak('sex=' + habbo.Gender, 13);
    appendStringWithBreak('customData=' + habbo.Motto, 13);
    appendStringWithBreak('ph_tickets=' + habbo.Tickets.toString(), 13);
    appendStringWithBreak('photo_film=' + habbo.Film.toString(), 13);
    appendStringWithBreak('ph_figure=', 13);
    appendStringWithBreak('directMail=0', 13);
  }
}
import '../../types/server_message.dart';

class RedeemVoucherErrorComposer extends ServerMessage {
  RedeemVoucherErrorComposer() : super(213) {
    appendString(1);
  }

}
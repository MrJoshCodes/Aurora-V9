import '../../types/server_message.dart';

class WalletBalanceComposer extends ServerMessage {
  WalletBalanceComposer(int coins) : super(6) {
    appendStringWithBreak(coins.toString() + '.0');
  }

}
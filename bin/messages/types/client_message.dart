import '../../utilities/base64_encoding.dart';
import '../../utilities/tuple.dart';
import '../../utilities/wire_encoding.dart';

class ClientMessage {
  String _packet;

  int _header;

  int get Header {
    return _header;
  }

  ClientMessage(String packet) {
    _packet = packet;

    _header = readB64();
  }

  int get RemainingLength {
    return _packet.length;
  }

  String remainingData() {
    return peekBytes(_packet.length);
  }

  String peekBytes(int amount) {
    return _packet.substring(0, amount);
  }

  String readBytes(int amount) {
    String data = _packet.substring(0, amount);
    _packet = _packet.substring(amount);
    return data;
  }

  int readB64() {
    return Base64Encoding.decodeInt(readBytes(2));
  }

  int readVL64() {
    Tuple tuple = WireEncoding.decodeInt(remainingData());
    _packet = _packet.substring(tuple.Item2);
    return tuple.Item1;
  }

  String readString() {
    return readBytes(readB64());
  }

  @override
  String toString() {
    return Base64Encoding.encodeInt(_header) + _packet;
  }
}
import '../../utilities/base64_encoding.dart';
import '../../utilities/wire_encoding.dart';

class ServerMessage {
  StringBuffer _packet;

  ServerMessage(int header) {
    _packet = new StringBuffer();
    appendB64(header);
  }

  void appendB64(int value) {
    _packet.write(Base64Encoding.encodeInt(value));
  }

  void appendVL64(int value) {
    _packet.write(WireEncoding.encodeInt(value));
  }
  
  void appendString(Object value) {
    _packet.write(value);
  }

  void appendStringWithBreak(Object value, [int delimiter = 2]) {
    appendString(value);

    if (delimiter > 0) 
      _packet.write(new String.fromCharCode(delimiter));
  }

  String getPacket() {
    return _packet.toString() + new String.fromCharCode(1);
  }

  @override
  String toString() {
    return _packet.toString();
  }
}
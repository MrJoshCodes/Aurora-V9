import '../messages/types/client_message.dart';

class UserPropertiesDecoder {
  Map<int, String> _properties;

  String operator [](int key){
    if (_properties.containsKey(key)) {
      return _properties[key];
    }

    return '';  
  }

  UserPropertiesDecoder(ClientMessage message) {
    if (message == null) return;

    _properties = new Map();

    while (message.RemainingLength > 2) {
      int id = message.readB64();

      if (id == 10) {
        message.readBytes(7);
        
        continue;
      }

      String value = message.readString();
      _properties[id] = value;
    }
  }
}
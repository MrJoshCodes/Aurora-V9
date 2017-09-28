import 'game/game.dart';
import 'logger.dart';
import 'messages/message_helper.dart';
import 'network/game_server.dart';
import 'storage/database_helper.dart';

class Engine {
  static DatabaseHelper _databaseHelper;
  static Game _game;
  static MessageHelper _messageHelper;
  static Logger _logger;

  static Game get HabboHotel {
    return _game;
  }

  static MessageHelper get Messages {
    return _messageHelper;
  }

  static DatabaseHelper get Database {
    return _databaseHelper;
  }
  
  static Logger get Log {
    return _logger;
  }

  static boot() async {
    _logger = new Logger();
    _logger.write('BOOT', 'Initializing HabboDart.');

    _databaseHelper = new DatabaseHelper();
    _game = new Game();
    _messageHelper = new MessageHelper();
    
    await new GameServer().start(12322);
  }
}
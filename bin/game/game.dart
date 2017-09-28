import 'catalogue/catalogue_manager.dart';
import 'habbos/habbo_manager.dart';
import 'sessions/session_manager.dart';

class Game {
  HabboManager _habboManager;
  SessionManager _sessionManager;
  CatalogueManager _catalogueManager;

  HabboManager get Habbos {
    return _habboManager;
  }

  SessionManager get Sessions {
    return _sessionManager;
  }
  
  CatalogueManager get Catalogue {
    return _catalogueManager;
  }

  Game() {
    _habboManager = new HabboManager();
    _sessionManager = new SessionManager();
    _catalogueManager = new CatalogueManager();
  }
}
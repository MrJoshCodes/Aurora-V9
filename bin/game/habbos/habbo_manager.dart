import '../../storage/database_connection.dart';
import 'habbo.dart';
import '../../engine.dart';
import 'dart:async';

import 'package:postgresql/postgresql.dart';

class HabboManager {
  Map<int, Habbo> _habbosById;
  Map<String, Habbo> _habbosByName;

  HabboManager() {
    _habbosById = new Map();
    _habbosByName = new Map();
  }

  Future<Habbo> getHabboById(int id) async {
    if (_habbosById.containsKey(id)) {
      return await _habbosById[id];
    }

    DatabaseConnection connection = await Engine.Database.getConnection();
    connection.setQuery('SELECT * FROM habbos WHERE id = @id LIMIT 1');
    connection.addParameter('id', id);

    Row row = await connection.getResult();

    if (row != null) {
      Habbo habbo = new Habbo(row.toMap());
      _habbosById.putIfAbsent(id, () => habbo);
      _habbosByName.putIfAbsent(habbo.Username, () => habbo);
      connection.dispose();
      return habbo;
    }

    return null;
  }

  Future<Habbo> getHabboByName(String username) async {
    if (_habbosByName.containsKey(username)) {
      return await _habbosByName[username];
    }

    DatabaseConnection connection = await Engine.Database.getConnection();
    connection.setQuery('SELECT * FROM habbos WHERE username = @username LIMIT 1');
    connection.addParameter('username', username);

    Row row = await connection.getResult();

    if (row != null) {
      Habbo habbo = new Habbo(row.toMap());
      _habbosById.putIfAbsent(habbo.Id, () => habbo);
      _habbosByName.putIfAbsent(username, () => habbo);
      connection.dispose();
      return habbo;
    }

    return null;
  }
}
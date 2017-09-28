import 'dart:async';
import 'package:postgresql/postgresql.dart';

class DatabaseConnection {
  Connection _connection;
  String _query;
  dynamic _parameters;

  DatabaseConnection() {
    _query = '';
    _parameters = {};
  }

  Future open(String connectionString) async {
    _connection = await connect(connectionString);
  }

  void setQuery(String query) {
    _query = query;
  }

  void addParameter(String key, dynamic value) {
    _parameters[key] = value;
  }

  Future execute() async {
    await _connection.execute(_query, _parameters);
  }

  Future<Row> getResult() async {
    List<Row> rows = await getResultSet();

    if (rows.length == 0) return null;

    return await rows[0];
  }

  Future<List<Row>> getResultSet() async {
    return await _connection.query(_query, _parameters).toList();
  }

  void dispose() {
    _connection.close();
    _query = '';
    _parameters = {};
  }
}
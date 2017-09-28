import '../utilities/stack.dart';
import 'dart:async';
import 'database_connection.dart';

class DatabaseHelper {
  final ConnectionString = 'postgres://postgres:123@localhost:5432/habbo';

  Stack<DatabaseConnection> _connectionPool;

  DatabaseHelper() {
    _connectionPool = new Stack<DatabaseConnection>();
  }
  
  Future<DatabaseConnection> getConnection() async {
    DatabaseConnection connection;

    if (_connectionPool.Count == 0) {
      connection = new DatabaseConnection();
      _connectionPool.push(connection);
    } else {
      connection = _connectionPool.pop();
    }
     
    await connection.open(ConnectionString);
    return connection;
  }
}
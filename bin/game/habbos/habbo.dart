import '../../engine.dart';
import '../../storage/database_connection.dart';
import 'dart:async';
import 'dart:core';

class Habbo {
  int _id;
  String _username;
  String _password;
  String _email;
  String _gender;
  String _figure;
  String _motto;
  int _coins;
  int _tickets;
  int _film;
  int _rank;

  Habbo(Map<dynamic, dynamic> row) {
    _id = row['id'];
    _username = row['username'];
    _password = row['password'];
    _email = row['email'];
    _gender = row['gender'];
    _figure = row['figure'];
    _motto = row['motto'];
    _coins = row['coins'];
    _tickets = row['tickets'];
    _film = row['film'];
    _rank = row['rank'];
  }

  int get Id {
    return _id;
  }

  String get Username {
    return _username;
  }

  String get Password {
    return _password;
  }

  void set Password(String password) {
    _password = password;
  }

  String get Email {
    return _email;
  }

  void set Email(String email) {
    _email = email;
  }

  String get Gender {
    return _gender;
  }

  void set Gender(String gender) {
    _gender = gender;
  }

  String get Figure {
    return _figure;
  }

  void set Figure(String figure) {
    _figure = figure;
  }

  String get Motto {
    return _motto;
  }

  void set Motto(String motto) {
    _motto = motto;
  }

  int get Coins {
    return _coins;
  }

  void set Coins(int coins) {
    _coins = coins;
  }

  int get Tickets {
    return _tickets;
  }

  void set Tickets(int tickets) {
    _tickets = tickets;
  }

  int get Film {
    return _film;
  }

  void set Film(int film) {
    _film = film;
  }

  int get Rank {
    return _rank;
  }

  void set Rank(int rank) {
    _rank = rank;
  }

  Future Update() async {
    DatabaseConnection connection = await Engine.Database.getConnection();
    connection.setQuery('UPDATE habbos SET email = @email, gender = @gender, figure = @figure, motto = @motto, coins = @coins, tickets = @tickets, film = @film, rank = @rank WHERE id = @id');
    connection.addParameter('email', _email);
    connection.addParameter('gender', _gender);
    connection.addParameter('figure', _figure);
    connection.addParameter('motto', _motto);
    connection.addParameter('coins', _coins);
    connection.addParameter('tickets', _tickets);
    connection.addParameter('film', _film);
    connection.addParameter('rank', _rank);
    connection.addParameter('id', _id);
    await connection.execute();
  }

}
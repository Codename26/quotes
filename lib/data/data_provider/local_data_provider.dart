import 'dart:isolate';

import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:quotes/data/model/quote.dart';
import 'package:sqflite/sqflite.dart';

class LocalDataProvider {
  Database _database;

  Future<Database> getDB() async {
    if (_database == null) {
      _database = await openDatabase(
        // Set the path to the database. Note: Using the `join` function from the
        // `path` package is best practice to ensure the path is correctly
        // constructed for each platform.
        join(await getDatabasesPath(), 'quotes_database.db'),
        // When the database is first created, create a table to store dogs.
        onCreate: (db, version) {
          return db.execute(
            "CREATE TABLE quotes(id TEXT PRIMARY KEY, text TEXT, author TEXT, favorite INTEGER, imageUrl TEXT, tag TEXT)",
          );
        },
        // Set the version. This executes the onCreate function and provides a
        // path to perform database upgrades and downgrades.
        version: 1,
      );
    }

    return _database;
  }

  Future saveQuotes(List<Quote> quotes) async {
    var db = await getDB();
    try {
      for (var i = 0; i < quotes.length; i++) {
        _insertQuote(quotes[i], db);
      }
      print("QUotes saved!");
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> _insertQuote(Quote quote, Database db) async {
    try {
      db.insert(
        'quotes',
        quote.toMap(),
        conflictAlgorithm: ConflictAlgorithm.ignore,
      );
    } catch (e) {
      print(e);
    }
  }

  Future<List<Quote>> getQuotes(String category) async {
    var db = await getDB();
    final List<Map<String, dynamic>> maps = await db.query('quotes', where: 'tag=?', whereArgs: [category]);
    return List.generate(maps.length, (i) {
      return Quote.fromMap(maps[i], category);
    });
  }

  Future<List<Quote>> getAllQuotes() async {
    // return List.empty();
    var db = await getDB();
    final List<Map<String, dynamic>> maps = await db.query('quotes', limit: 10);
    return List.generate(maps.length, (i) {
      return Quote.fromMap(maps[i], null);
    });
  }
}

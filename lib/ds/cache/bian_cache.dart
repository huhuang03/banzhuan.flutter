import 'package:banzhuan/globals.dart';
import 'package:banzhuan/market/bian/bean_bian.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class BianCache {
  Database database;

  BianCache() {
    WidgetsFlutterBinding.ensureInitialized();
    final Future<Database> database = openDatabase(
        join(databasePath, 'doggie_database.db'),
    );
  }

  BianCache getCache() {

  }

  saveCache(BianExchangeInfo exchangeInfo) {

  }

  bool hasCache() {
  }
}

var bianCache = BianCache();

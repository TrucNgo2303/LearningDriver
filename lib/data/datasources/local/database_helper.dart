import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "driver_learning_v2.db");

    // Kiểm tra xem database đã tồn tại chưa
    var exists = await databaseExists(path);

    if (!exists) {
      // Nếu chưa có, tiến hành copy từ assets
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      // Đọc file từ assets
      ByteData data = await rootBundle.load(
        join("assets/database", "driver_learning_v2.db"),
      );
      List<int> bytes = data.buffer.asUint8List(
        data.offsetInBytes,
        data.lengthInBytes,
      );

      // Ghi file vào bộ nhớ thiết bị
      await File(path).writeAsBytes(bytes, flush: true);
    }

    // Mở database
    return await openDatabase(path, readOnly: false);
  }
}

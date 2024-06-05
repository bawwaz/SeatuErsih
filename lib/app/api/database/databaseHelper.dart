import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dataOrder.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'shoe_cleaning_order.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE orders(id INTEGER PRIMARY KEY, shoeName TEXT, pickupDate TEXT, note TEXT)",
        );
      },
    );
  }

  Future<void> insertOrder(ShoeCleaningOrder order) async {
    final db = await database;
    await db.insert('orders', order.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<ShoeCleaningOrder>> fetchOrders() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('orders');
    return List.generate(maps.length, (i) {
      return ShoeCleaningOrder(
        shoeName: maps[i]['shoeName'],
        pickupDate: maps[i]['pickupDate'],
        note: maps[i]['note'],
      );
    });
  }
}

import 'package:ecommerce/model/cart_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class CartDatabaseHelper {
  CartDatabaseHelper._();
  static final CartDatabaseHelper db = CartDatabaseHelper._();

  static Database _database;

  Future<Database> get database async {
    if (_database != null)
      return _database;
    else {
      _database = await initDb();
      return _database;
    }
  }

  initDb() async {
    String path = join(await getDatabasesPath(), "CartData.db");
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
      CREATE TABLE cart(
          quantity INTEGER ,
          name TEXT NOT NULL,
          price TEXT NOT NULL, 
          id TEXT NOT NULL,
          image TEXT NOT NULL)
          ''');
    });
  }

  Future<void> insertProduct(CartModel cartModel) async {
    var dbClient = await database;
    await dbClient.insert('cart', cartModel.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  updateProduct(CartModel cartModel) async {
    var dbClient = await database;
    return await dbClient.update('cart', cartModel.toJson(),
        where: 'id =?', whereArgs: [cartModel.id]);
  }

  Future<List<CartModel>> getAllProducts() async {
    var dbClient = await database;
    List<Map> maps = await dbClient.query('cart');
    List<CartModel> list = maps.isNotEmpty
        ? maps.map((product) => CartModel.fromJson(product)).toList()
        : [];
    return list;
  }
}

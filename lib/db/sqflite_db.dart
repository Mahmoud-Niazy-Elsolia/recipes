import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
List<int> ids = [];

class SqfliteDb {
  static Database? _database ;

  Future<Database?> get database async{
    if(_database == null){
      _database = await init();
      return _database;
    }
    else{
      return _database;
    }
  }


  init() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'recipes.db');
    Database database = await openDatabase(
      path,
      version: 1,
      onCreate: onCreate,
    );
    return database;
  }

  onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE 'favourites' (id INTEGER , title TEXT , image TEXT)");
    print('Created Successfully....');
  }

  Future<List<Map>> getData()async{
    Database? myDatabase = await database;
    List<Map> response = await myDatabase!.rawQuery("SELECT * FROM 'favourites'");
    for(var i in response){
      ids.add(i['id']);
    }
    return response;

  }

  Future<void> insertData({
    required int id,
    required String title,
    required String image,
  })async{
    ids.add(id);
    Database? myDatabase = await database;
    await myDatabase!.rawInsert("INSERT INTO 'favourites' ('id' ,'title', 'image') VALUES( '$id' , '$title' , '$image')");
  }

  Future<int> deleteData({
    required int id,
  })async{
    ids.remove(id);
    Database? myDatabase = await database;
    int bookId = await myDatabase!.rawDelete("DELETE FROM 'favourites' WHERE id = ?", [id]);
    return bookId;
  }
}
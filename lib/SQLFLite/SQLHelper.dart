import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'TaskDB.dart';

class SQLHelper {
  static SQLHelper helper = SQLHelper._();
  Database database;
  static String TABLE_NAME = "Task";
  static String ID = "id";
  static String NAME = "name";
  static String IS_COMPLETE = "isComplete";

  SQLHelper._();

  initDataBase() async {
    if (database == null) {
      return database = await onCreateDataBase();
    } else
      return database;
  }

  Future<Database> onCreateDataBase() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path + '/task.db';

    Database database =
        await openDatabase(appDocPath, version: 1, onCreate: (db, v) async {
      db.execute(
          'CREATE TABLE $TABLE_NAME ($ID INTEGER PRIMARY KEY, $NAME TEXT, $IS_COMPLETE INTEGER)');
    });

    return database;
  }

  insertData(TaskDB taskDB) async {
    var rowNum = await database.insert(TABLE_NAME, taskDB.toMap());
    print(rowNum);
  }

  getAllData() async {
    List<Map> data = await database.query(TABLE_NAME);
    print(data);
  }

  getSingleData(int id) async {
    List<Map> data =
        await database.query(TABLE_NAME, where: '$ID=?', whereArgs: [id]);
    // List<Map> data = await database.query(TABLE_NAME,where: '$ID=$id');
    print(data);
  }

  deleteTask(int id) async {
    int deleteRowNum =
        await database.delete(TABLE_NAME, where: '$ID=?', whereArgs: [id]);
    print(deleteRowNum);
  }

  updateTask(TaskDB taskDB) async {
    var x = await database.update(TABLE_NAME, taskDB.toMap(),
        where: '$ID=?', whereArgs: [taskDB.id]);
    print(x);
  }

  updateTaskMap(TaskDB taskDB) async {
    Map<String, dynamic> row = {IS_COMPLETE: taskDB.isComplete?1:0};
    var x = await database
        .update(TABLE_NAME, row, where: '$ID=?', whereArgs: [taskDB.id]);
    print(x);
  }

  Future close() async => database.close();
}

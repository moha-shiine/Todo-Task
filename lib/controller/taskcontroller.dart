import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:taskapp/model/taskmodel.dart';

class TasksController extends GetxController {
  final RxList<Taskmodel> tasks = <Taskmodel>[].obs;

  Future<sql.Database> _db() async {
    return sql.openDatabase(
      'tasks.db',
      version: 3,
      onCreate: (db, version) {
        return db.execute(
          """
          CREATE TABLE tasks(
            id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
            title TEXT,
            category TEXT, 
            subtitle TEXT, 
            timeTask TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
          )
          """,
        );
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 3) {
          // Drop the old table if necessary and recreate it
          await db.execute("DROP TABLE IF EXISTS tasks");
          await db.execute("""
            CREATE TABLE tasks(
              id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
              title TEXT,
              category TEXT, 
              subtitle TEXT, 
              timeTask TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
            )
          """);
        }
      },
    );
  }

  Future<void> insertTask(Map<String, dynamic> task) async {
    try {
      final db = await _db();
      await db.insert(
        'tasks',
        task,
        conflictAlgorithm: sql.ConflictAlgorithm.replace,
      );

      await getTasks();
      print(getTasks);
    } catch (e) {
      print("Error inserting task: $e");
    }
  }

  Future<void> getTasks() async {
    try {
      final db = await _db();
      final data = await db.query('tasks');

      tasks.assignAll(data.map((task) => Taskmodel.fromJson(task)).toList());
      print(tasks);
    } catch (e) {
      print("Error fetching tasks: $e");
    }
  }

  Future<void> deleteTask(int id) async {
    try {
      final db = await _db();
      await db.delete(
        'tasks',
        where: 'id = ?',
        whereArgs: [id],
      );
      await getTasks();
    } catch (e) {
      print("Error deleting task: $e");
    }
  }

  Future<void> updateTask(Taskmodel task) async {
    try {
      final db = await _db();
      await db.update(
        'tasks',
        task.toJson(),
        where: 'id = ?',
        whereArgs: [task.id],
      );

      await getTasks();
    } catch (e) {
      print("Error updating task: $e");
    }
  }
}

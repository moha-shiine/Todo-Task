import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:taskapp/model/taskmodel.dart';

class TasksController extends GetxController {
  final RxList<Taskmodel> tasks = <Taskmodel>[].obs;

  Future<sql.Database> _db() async {
    return sql.openDatabase(
      'tasks.db',
      version: 4, // Incremented version to ensure schema update
      onCreate: (db, version) {
        return db.execute(
          """
          CREATE TABLE tasks(
            id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
            title TEXT,
            category TEXT, 
            subtitle TEXT, 
            start_time TEXT,  // Fixed column name
            end_time TEXT,    // Fixed column name
            timeTask TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
          )
          """,
        );
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 4) {
          // Add start_time and end_time columns if upgrading from an older version
          await db.execute("ALTER TABLE tasks ADD COLUMN start_time TEXT");
          await db.execute("ALTER TABLE tasks ADD COLUMN end_time TEXT");
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
      print(tasks);
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

      // Ensure correct column names are used
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

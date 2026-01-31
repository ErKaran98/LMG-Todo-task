import 'package:hive/hive.dart';
import '../models/todo_model.dart';

class HiveService {
  static const String todoBoxName = 'todos';

  static Future<void> openTodoBox() async {
    await Hive.openBox<TodoModel>(todoBoxName);
  }

  static Box<TodoModel> getTodoBox() {
    return Hive.box<TodoModel>(todoBoxName);
  }
}
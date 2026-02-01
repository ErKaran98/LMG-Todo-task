import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../../data/models/todo_model.dart';
import '../../../data/local/hive_service.dart';

class TodoController extends GetxController {
  late Box<TodoModel> _todoBox;

  final RxList<TodoModel> todos = <TodoModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    _todoBox = HiveService.getTodoBox();
    loadTodos();
  }

  void loadTodos() {
    todos.value = _todoBox.values.toList();
  }

  void deleteTodo(TodoModel todo) {
    todo.delete();
    loadTodos();
  }
}
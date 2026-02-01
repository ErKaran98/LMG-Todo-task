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

  void addTodo({
    required String title,
    required String description,
    required int totalSeconds,
  }) {
    final todo = TodoModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      description: description,
      totalDuration: totalSeconds,
      remainingDuration: totalSeconds,
      status: 'TODO',
      createdAt: DateTime.now(),
    );

    _todoBox.add(todo);
    loadTodos();
  }
}
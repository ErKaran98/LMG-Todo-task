import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../../data/models/todo_model.dart';
import '../../../data/local/hive_service.dart';

class TodoController extends GetxController {
  late Box<TodoModel> _todoBox;

  final RxList<TodoModel> todos = <TodoModel>[].obs;
  final RxString searchQuery = ''.obs;
  final RxBool isSearching = false.obs;

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
  void updateTodo(
      TodoModel oldTodo, {
        required String title,
        required String description,
        required int totalSeconds,
      }) {
    final index = _todoBox.values.toList().indexWhere(
          (todo) => todo.id == oldTodo.id,
    );

    if (index == -1) return;

    final updatedTodo = TodoModel(
      id: oldTodo.id,
      title: title,
      description: description,
      totalDuration: totalSeconds,
      remainingDuration: totalSeconds,
      status: oldTodo.status,
      createdAt: oldTodo.createdAt,
    );

    _todoBox.putAt(index, updatedTodo);
    loadTodos();
  }

  List<TodoModel> get filteredTodos {
    if (searchQuery.value.isEmpty) {
      return todos;
    }

    final query = searchQuery.value.toLowerCase();

    return todos.where((todo) {
      return todo.title.toLowerCase().contains(query) ||
          todo.description.toLowerCase().contains(query);
    }).toList();
  }

  void updateSearch(String query) {
    searchQuery.value = query;
  }

  void startSearch() {
    isSearching.value = true;
  }

  void stopSearch() {
    isSearching.value = false;
    searchQuery.value = '';
  }

}
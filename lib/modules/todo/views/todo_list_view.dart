import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lmg_todo_task/core/utils/dialog_utils.dart' show DialogUtils;
import 'package:lmg_todo_task/modules/todo/views/todo_form_sheet.dart';

import '../controllers/todo_controller.dart';
import '../widgets/todo_item_widget.dart';

class TodoListView extends StatelessWidget {
  const TodoListView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final horizontalPadding = screenWidth < 400 ? 12.0 : 16.0;
    final controller = Get.find<TodoController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.bottomSheet(
            const TodoFormSheet(),
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Obx(() {
        if (controller.todos.isEmpty) {
          return const Center(
            child: Text('No todos yet'),
          );
        }

        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: 12,
          ),
          child: ListView.separated(
            itemCount: controller.todos.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final todo = controller.todos[index];
              return TodoItemWidget(
                title: todo.title,
                description: todo.description,
                status: todo.status,
                time: _formatTime(todo.remainingDuration),
                onDelete: () {
                  DialogUtils.showDeleteConfirmation(
                    onConfirm: () => controller.deleteTodo(todo),
                  );
                },
              );
            },
          ),
        );
      }),
    );
  }
}

String _formatTime(int seconds) {
  final minutes = seconds ~/ 60;
  final secs = seconds % 60;
  return '${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
}

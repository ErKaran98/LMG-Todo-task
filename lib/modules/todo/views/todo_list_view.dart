import 'package:flutter/material.dart';
import '../widgets/todo_item_widget.dart';

class TodoListView extends StatelessWidget {
  const TodoListView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final horizontalPadding = screenWidth < 400 ? 12.0 : 16.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: 12,
        ),
        child: ListView.separated(
          itemCount: _dummyTodos.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final todo = _dummyTodos[index];
            return TodoItemWidget(
              title: todo['title']!,
              description: todo['description']!,
              status: todo['status']!,
              time: todo['time']!,
            );
          },
        ),
      ),
    );
  }
}


final List<Map<String, String>> _dummyTodos = [
  {
    'title': 'Design UI',
    'description': 'Create todo list UI',
    'status': 'TODO',
    'time': '05:00',
  },
  {
    'title': 'Implement Timer',
    'description': 'Add start pause stop logic',
    'status': 'IN-PROGRESS',
    'time': '02:30',
  },
  {
    'title': 'Testing',
    'description': 'Test edge cases',
    'status': 'DONE',
    'time': '00:00',
  },
];

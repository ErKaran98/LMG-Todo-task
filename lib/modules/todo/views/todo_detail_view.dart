import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/todo_controller.dart';
import 'todo_form_sheet.dart';

class TodoDetailView extends StatelessWidget {
  const TodoDetailView({super.key, required this.todoId});

  final String todoId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TodoController>();

    return Scaffold(
      backgroundColor: const Color(0xFFF6F2FA),
      appBar: AppBar(
        title: const Text('Todo Details'),
        actions: [
          Obx(() {
            final todo =
            controller.todos.firstWhereOrNull((t) => t.id == todoId);

            if (todo == null) return const SizedBox.shrink();

            return IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                Get.bottomSheet(
                  TodoFormSheet(todo: todo),
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                );
              },
            );
          }),
        ],
      ),
      body: Obx(() {
        final todo =
        controller.todos.firstWhereOrNull((t) => t.id == todoId);

        if (todo == null) {
          return const Center(child: Text('Todo not found'));
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.deepPurple.withOpacity(0.9),
                      Colors.deepPurple.withOpacity(0.7),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      todo.title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        _StatusChip(status: todo.status),
                        const Spacer(),
                        Text(
                          _formatTime(todo.totalDuration),
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              _InfoCard(
                label: 'Description',
                icon: Icons.notes,
                value: Text(
                  todo.description.isEmpty
                      ? 'No description'
                      : todo.description,
                  style: const TextStyle(fontSize: 15),
                ),
              ),

              const SizedBox(height: 12),

              IntrinsicHeight(
                child: Row(
                  children: [
                    Expanded(
                      child: _InfoCard(
                        label: 'Status',
                        icon: Icons.flag,
                        value: Text(
                          todo.status,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.deepPurple,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _InfoCard(
                        label: 'Total Time',
                        icon: Icons.timer,
                        value: Text(
                          _formatTime(todo.totalDuration),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              _InfoCard(
                label: 'Created At',
                icon: Icons.calendar_today,
                value: Text(
                  '${todo.createdAt.day}/${todo.createdAt.month}/${todo.createdAt.year}',
                  style: const TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  static String _formatTime(int seconds) {
    final m = seconds ~/ 60;
    final s = seconds % 60;
    return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }
}

class _InfoCard extends StatelessWidget {
  final String label;
  final Widget value;
  final IconData icon;

  const _InfoCard({
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 16, color: Colors.deepPurple),
              const SizedBox(width: 6),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          value,
        ],
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  final String status;

  const _StatusChip({required this.status});

  @override
  Widget build(BuildContext context) {
    Color bg;
    Color text;

    switch (status) {
      case 'DONE':
        bg = Colors.green.withOpacity(0.2);
        text = Colors.green;
        break;
      case 'IN-PROGRESS':
        bg = Colors.orange.withOpacity(0.2);
        text = Colors.orange;
        break;
      default:
        bg = Colors.white.withOpacity(0.25);
        text = Colors.deepPurple;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: text,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
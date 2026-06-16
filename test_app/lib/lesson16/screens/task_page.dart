import 'package:flutter/material.dart';

import '../models/task.dart';
import '../widgets/task_card.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() {
    return _TaskPageState();
  }
}

class _TaskPageState extends State<TaskPage> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  List<Task> tasks = [
    Task(
      title: 'Learn Dart',
      description: 'Practice variables, functions and classes',
    ),
    Task(
      title: 'Practice Flutter',
      description: 'Build UI with widgets',
    ),
    Task(
      title: 'Split project',
      description: 'Use models, screens and widgets folders',
    ),
  ];

  int get completedCount {
    return tasks.where((task) => task.isDone).length;
  }

  void addTask() {
    String title = titleController.text.trim();
    String description = descriptionController.text.trim();

    if (title.isEmpty) {
      print('Title is empty');
      return;
    }

    setState(() {
      tasks.add(
        Task(
          title: title,
          description: description.isEmpty ? 'No description' : description,
        ),
      );

      titleController.clear();
      descriptionController.clear();
    });

    print('Task added: $title');
  }

  void toggleTask(int index, bool value) {
    setState(() {
      tasks[index].isDone = value;
    });

    print('Task changed: ${tasks[index].title}');
  }

  void removeTask(int index) {
    setState(() {
      print('Task removed: ${tasks[index].title}');
      tasks.removeAt(index);
    });
  }

  void clearCompletedTasks() {
    setState(() {
      tasks.removeWhere((task) => task.isDone);
    });

    print('Completed tasks cleared');
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter 16: Project Structure'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              'Task Manager',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Task title',
                hintText: 'Enter task title',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.title),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                labelText: 'Task description',
                hintText: 'Enter task description',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.description),
              ),
            ),

            const SizedBox(height: 15),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: addTask,
                    child: const Text('Add Task'),
                  ),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: OutlinedButton(
                    onPressed: clearCompletedTasks,
                    child: const Text('Clear Done'),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total: ${tasks.length}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Completed: $completedCount',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            Expanded(
              child: tasks.isEmpty
                  ? const Center(
                      child: Text(
                        'No tasks yet',
                        style: TextStyle(fontSize: 20),
                      ),
                    )
                  : ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        final task = tasks[index];

                        return TaskCard(
                          task: task,
                          index: index,
                          onChanged: (value) {
                            toggleTask(index, value);
                          },
                          onDelete: () {
                            removeTask(index);
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
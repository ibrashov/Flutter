import 'package:flutter/material.dart';

import '../models/task.dart';
import '../services/task_storage_service.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({super.key});

  @override
  State<TasksPage> createState() {
    return _TasksPageState();
  }
}

class _TasksPageState extends State<TasksPage> {
  final TaskStorageService taskStorageService = TaskStorageService();

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  List<Task> tasks = [];
  bool isLoading = true;
  String message = 'Loading tasks...';

  @override
  void initState() {
    super.initState();
    loadTasks();
  }

  Future<void> loadTasks() async {
    try {
      final loadedTasks = await taskStorageService.loadTasks();

      setState(() {
        tasks = loadedTasks;
        isLoading = false;
        message = 'Tasks loaded: ${tasks.length}';
      });
    } catch (e) {
      setState(() {
        tasks = [];
        isLoading = false;
        message = 'Failed to load tasks: $e';
      });
    }
  }

  Future<void> saveTasks() async {
    await taskStorageService.saveTasks(tasks);
  }

  Future<void> addTask() async {
    final title = titleController.text.trim();
    final description = descriptionController.text.trim();

    if (title.isEmpty || description.isEmpty) {
      setState(() {
        message = 'Title and description cannot be empty';
      });
      return;
    }

    final newTask = Task(
      id: DateTime.now().millisecondsSinceEpoch,
      title: title,
      description: description,
      isDone: false,
    );

    setState(() {
      tasks.insert(0, newTask);
      titleController.clear();
      descriptionController.clear();
      message = 'Task added';
    });

    await saveTasks();
  }

  Future<void> toggleTask(int index) async {
    final oldTask = tasks[index];

    final updatedTask = oldTask.copyWith(
      isDone: !oldTask.isDone,
    );

    setState(() {
      tasks[index] = updatedTask;
      message = updatedTask.isDone ? 'Task completed' : 'Task reopened';
    });

    await saveTasks();
  }

  Future<void> deleteTask(int index) async {
    setState(() {
      tasks.removeAt(index);
      message = 'Task deleted';
    });

    await saveTasks();
  }

  Future<void> clearAllTasks() async {
    setState(() {
      tasks.clear();
      message = 'All tasks cleared';
    });

    await taskStorageService.clearTasks();
  }

  int get completedCount {
    return tasks.where((task) {
      return task.isDone;
    }).length;
  }

  int get pendingCount {
    return tasks.length - completedCount;
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  Widget buildForm() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'Create Task',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
                hintText: 'Enter task title',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.title),
              ),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: descriptionController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: 'Description',
                hintText: 'Enter task description',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.description),
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: addTask,
                icon: const Icon(Icons.add),
                label: const Text('Add Task'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildStatsCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  const Icon(Icons.list),
                  const SizedBox(height: 6),
                  Text(
                    '${tasks.length}',
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text('Total'),
                ],
              ),
            ),

            Expanded(
              child: Column(
                children: [
                  const Icon(Icons.check_circle),
                  const SizedBox(height: 6),
                  Text(
                    '$completedCount',
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text('Done'),
                ],
              ),
            ),

            Expanded(
              child: Column(
                children: [
                  const Icon(Icons.pending_actions),
                  const SizedBox(height: 6),
                  Text(
                    '$pendingCount',
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text('Pending'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMessageCard() {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.info),
        title: const Text('Status'),
        subtitle: Text(message),
      ),
    );
  }

  Widget buildTaskCard(int index) {
    final task = tasks[index];

    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Checkbox(
          value: task.isDone,
          onChanged: (value) {
            toggleTask(index);
          },
        ),
        title: Text(
          task.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            decoration: task.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Text(task.description),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            deleteTask(index);
          },
        ),
      ),
    );
  }

  Widget buildTasksList() {
    if (tasks.isEmpty) {
      return const Card(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Center(
            child: Text(
              'No tasks yet',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      );
    }

    return Column(
      children: [
        for (int i = 0; i < tasks.length; i++)
          buildTaskCard(i),
      ],
    );
  }

  Widget buildBody() {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        buildForm(),

        const SizedBox(height: 12),

        buildStatsCard(),

        const SizedBox(height: 12),

        buildMessageCard(),

        const SizedBox(height: 12),

        buildTasksList(),

        const SizedBox(height: 12),

        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: clearAllTasks,
            icon: const Icon(Icons.delete_forever),
            label: const Text('Clear All Tasks'),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter 32: Storage Service'),
      ),
      body: buildBody(),
    );
  }
}
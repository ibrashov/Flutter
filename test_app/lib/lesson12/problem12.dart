import 'package:flutter/material.dart';
void main(){
  runApp(const MyApp());
}
class Task{
  final String title;
  final String description;
  bool isDone;
  Task({
    required this.title,
    required this.description,
    required this.isDone,
  });
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Problem 12',
      home: const TaskPage(),
    );
  }
}
class TaskPage extends StatefulWidget{
  const TaskPage({super.key});
  State<TaskPage> createState(){
    return _TaskPageState();
  }
}
class _TaskPageState extends State<TaskPage>{
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  List<Task> tasks =[
    Task(
      title: 'Learn Dart',
      description: 'Dart something somthing for google something',
      isDone: false
    ),
    Task(
      title: 'Learn Dart',
      description: 'Dart something somthing for google something',
      isDone: false
    ),
    Task(
      title: 'Learn Dart',
      description: 'Dart something somthing for google something',
      isDone: false
    ),
  ];
  int get completedCount{
    return tasks.where((task) => task.isDone).length;
  }
  void addTask(){
    String title = titleController.text.trim();
    String description = descriptionController.text.trim();
    if(title.isEmpty){
      print('Is Empty');
      return;
    }
    setState((){
        tasks.add(
          Task(title: title, description: description.isEmpty ? 'No Description': description, isDone: false),
        );
        titleController.clear();
        descriptionController.clear();
    });
    print('Task add: $title');
  }
  void toggleTask(int index, bool value){
    setState(() {
        tasks[index].isDone = value;
    });
    print('Status changed: ${tasks[index].title}');
  }
  void removeTask(int index){
    setState(() {
      print('Task removed: ${tasks[index].title}');
      tasks.removeAt(index);
    });
  }
  void clearTask(){
    setState(() {
      tasks.removeWhere((task)=> task.isDone);
    });
    print('Completed task cleared');
  }
  void dispose(){
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('Problem 11 New',)),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            const Text('Task Manager', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'title',
                hintText: 'Enter title',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.title)
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                labelText: 'description',
                hintText: 'Enter description',
                prefixIcon: Icon(Icons.description),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: addTask,
                    child: const Text('Task added'),
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ElevatedButton(
                    onPressed: clearTask,
                    child: const Text('Task cleared'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total: ${tasks.length}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text('Completed: ${completedCount}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: tasks.isEmpty ? const Center(
                child: Text('No taks yet', style: TextStyle(fontSize: 30)),
                )
                :ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (contex, index){
                    final task = tasks[index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: ListTile(
                        leading: Checkbox(
                          value: task.isDone,
                          onChanged: (value){
                            toggleTask(index, value ?? false);
                          }
                        ),
                        title: Text(task.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, decoration: task.isDone ? TextDecoration.lineThrough : TextDecoration.none),),
                        subtitle: Text(task.description),
                        trailing: IconButton(icon: const Icon(Icons.delete), onPressed: (){removeTask(index);})
                      ),
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
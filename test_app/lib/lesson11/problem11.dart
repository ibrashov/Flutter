import 'package:flutter/material.dart';
void main(){
    runApp( const MyApp());
}
class MyApp extends StatelessWidget{
    const MyApp({super.key});
    Widget build (BuildContext context){
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Problem 11',
            home: const ToDoPage(),
        );
    }
}
class ToDoPage extends StatefulWidget{
    const ToDoPage({super.key});
    State<ToDoPage> createState(){
        return _ToDoPageState();
    }
}
class _ToDoPageState extends State<ToDoPage>{
    final taskController = TextEditingController();
    List<String> tasks = [];
    void addTask(){
        String taskText = taskController.text.trim();
        if(taskText.isEmpty){
            return;
        }
        setState((){
            tasks.add(taskText);
            taskController.clear();
        });
    }
    void removeTask(int index){
        setState((){
            tasks.removeAt(index);
        });
    }
    void clearAllTasks(){
        setState((){
            tasks.clear();
        });
    }
    void dispose(){
        taskController.dispose();
        super.dispose();
    }
    Widget build( BuildContext context){
        return Scaffold(
            appBar: AppBar(title: const Text('Problem 10 ToDo')),
            body: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                    children: [
                        const Text('ToDo List', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 20),
                        TextField(
                            controller: taskController,
                            decoration: const InputDecoration(
                                labelText: 'Task',
                                hintText: 'Enter Task',
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.task)
                            ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                            children: [
                                Expanded(
                                    child: ElevatedButton(
                                        onPressed: addTask,
                                        child: const Text('Add')
                                    ),
                                ),
                                const SizedBox(height: 20),
                                Expanded(
                                    child: ElevatedButton(
                                        onPressed: clearAllTasks,
                                        child: const Text('Clear all')
                                    ),
                                ),
                            ],
                        ),
                        const SizedBox(height: 20),
                        Text(
                            'Total tasks: ${tasks.length}',
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
                        ),
                        const SizedBox(height: 20),
                        Expanded(
                            child: tasks.isEmpty ? const Center(
                                child: Text( 'No tasks yet', style: TextStyle(fontSize: 20)),
                            )
                            : ListView.builder(
                                itemCount: tasks.length,
                                itemBuilder: (context, index){
                                    return Card(
                                        margin: const EdgeInsets.only(bottom: 20),
                                        child: ListTile(
                                            leading: CircleAvatar(child: Text('${index+1}')),
                                            title: Text(tasks[index], style: const TextStyle(fontSize: 20)),
                                            trailing: IconButton(icon: const Icon(Icons.delete), onPressed: (){removeTask(index);}),
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

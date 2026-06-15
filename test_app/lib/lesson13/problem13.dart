import 'package:flutter/material.dart';
void main(){
  runApp(const MyApp());
}
class Task{
  final String title;
  bool isDone;
  Task({
    required this.title,
    this.isDone = false
  });
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Problem 13',
      home: const MainPage(),
    );
  }
}
class MainPage extends StatefulWidget{
  const MainPage({super.key});
  State<MainPage> creatState(){
    return _MainPageState();
  }
}
class _MainPageState extends State<MainPage>{
  int selectedIndex = 0;
  final taskController = TextEditingController();
  List<Task> tasks = [
    Task(title: 'Learn dart', isDone: false),
    Task(title: 'Pracrice everyday', isDone: false),
    Task(title: ' Build Apps ', isDone: false)
  ];
  int completedTask(int index){
    return tasks.where((task)=> task.isDone).length;
  }
  void changeTab(int index){
    setState(() {
      selectedIndex = index;
    });
  }
  void addTask(){
    String text = taskController.text.trim();
    if(text.isEmpty){
      return;
    }
    setState(() {
      tasks.add(Task(title: text));
      taskController.clear();
    });
    print('Task added: $text');
  }
  void toggleTask(int index, bool value){
    setState(() {
      tasks[index].isDone = value;
    });
  }
  void removeTask(int index){
    setState(() {
      print('Task removed: ${tasks[index].title}');
      tasks.removeAt(index);
    });
  }
  Widget buildHomePage(){
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.home, size: 90),
          const SizedBox(height: 20),
          const Text('Home Page', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Text('Total task: ${tasks.length}', style: TextStyle(fontSize: 30)),
          const SizedBox(height: 20),
          Text('Completed task: $completedTask', style: TextStyle(fontSize: 30)),
        ],
      ),
    );
  }
  Widget buildTasksPage(){
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text('Task', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          TextField(
            controller: taskController,
            decoration: const InputDecoration(
              labelText: 'Task',
              hintText: 'Enter task',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.task)
            )
          ),
          const SizedBox(),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: addTask,
              child: const Text('Add Task')
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: tasks.isEmpty ? const Center(
              child: Text('No task yet', style: TextStyle(fontSize: 20)),
            )
            : ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index){
                  final task = tasks[index];
                  return Card(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: ListTile(
                    leading: Checkbox(
                      value: task.isDone,
                      onChanged: (value){
                        toggleTask(index, value ?? false);
                      },
                    ),
                    title: Text(
                      task.title, 
                      style: TextStyle(fontSize: 20,
                      decoration: task.isDone ? TextDecoration.lineThrough
                                : TextDecoration.none
                      ),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: (){
                        removeTask(index);
                      }
                    ),
                  ),
                  );
                }
            ),
          ),
        ],
      ),
    );
  }
  Widget buildProfilePage() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          CircleAvatar(
            radius: 55,
            child: Icon(
              Icons.person,
              size: 65,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Anuar',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Future Flutter Developer',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 10),
          Text(
            'Almaty, Kazakhstan',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
  Widget getCurrentPage(){
    if(selectedIndex == 0){
      return buildHomePage();
    }else if(selectedIndex == 1){
      return buildTasksPage();
    }else{
      return buildProfilePage();
    }
  }
  String getCurrentTitle(){
    if(selectedIndex == 0 ){
      return 'Home';
    }else if(selectedIndex == 1){
      return 'Tasks';
    }else{
      return 'Profile';
    }
  }
  void dispose(){
    taskController.dispose();
    super.dispose();
  }
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text(getCurrentTitle())),
      body: getCurrentPage(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: changeTab,
        items:const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.task), label: 'Task'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ]
      ),
    );
  }
}

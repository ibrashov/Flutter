import 'package:flutter/material.dart';
void main(){
  runApp(const MyApp());
}
class MenuPage{
  final String title;
  final IconData icon;
  const MenuPage({
    required this.title,
    required this.icon
  });
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Problem 14 Flutter',
      home: const MainDrawerPage(),
    );
  }
}
class MainDrawerPage extends StatefulWidget{
  const MainDrawerPage({super.key});
  State<MainDrawerPage> createState(){
    return _MainDrawerPageState();
  }
}
class _MainDrawerPageState extends State<MainDrawerPage>{
  int selectedIndex = 0;
  final List<MenuPage> page = const[
    MenuPage(title: 'Home', icon: Icons.home),
    MenuPage(title: 'Task', icon: Icons.task),
    MenuPage(title: 'Profile', icon: Icons.person),
    MenuPage(title: 'Settings', icon: Icons.settings)
  ];
  void changePage(int index){
    setState(() {
      selectedIndex = index;
    });
    Navigator.pop(context);
  }
  void showMessage(String message){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message))
    );
  }
  Widget buildHomePage(){
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.home, size: 80),
          SizedBox(height: 20),
          Text('Home Page', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          Text('Welcom to the problem14', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
  Widget buildTasksPage(){
    final List<String> tasks = [
      'Learn Dart', 'Pracrice App', 'Build something'
    ];
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: tasks.length,
      itemBuilder: (context, index){
        return Card(
          margin: const EdgeInsets.only(bottom: 10),
          child: ListTile(
            leading: CircleAvatar(
              child: Text('${index+1}'),

            ),
            title: Text(tasks[index]),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),

        );
      },
    );
  }
  Widget buildProfilePage() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(radius: 55, child: Icon(Icons.person,size: 65)),
          SizedBox(height: 20),
          Text('Anuar', style: TextStyle( fontSize: 32, fontWeight: FontWeight.bold) ),
          SizedBox(height: 10),
          Text('Future Flutter Developer', style: TextStyle(fontSize: 20)),
          SizedBox(height: 10),
          Text( 'Almaty, Kazakhstan',style: TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
  Widget buildSettingsPage(){
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Icon(Icons.settings, size: 90),
          const SizedBox(height: 20),
          const Text('Settings Page', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Card(
            child: SwitchListTile(
              value:true, 
              onChanged: (value) {
                showMessage('Notifications changed');
              },
              title: const Text('Notifications'),
              secondary: const Icon(Icons.notifications),
            ),
          ),
          Card(
            child: SwitchListTile(
              value: false,
              onChanged: (value){
                showMessage('Dark mode changed');
              },
              title: const Text('Dark mode'),
              secondary: const Icon(Icons.dark_mode),
            ),
          ),
        ],
      ),
    );
  }
  Widget getCurrentPage(){
    if(selectedIndex ==0){
      return buildHomePage();
    }else if(selectedIndex == 1){
      return buildTasksPage();
    }else if(selectedIndex == 2){
      return buildProfilePage();
    }else{
      return buildSettingsPage();
    }
  }
  String getCurrentTitle(){
    return page[selectedIndex].title;
  }
  Drawer buildDrawer(){
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text('Anuar'),
            accountEmail: Text('zarpache12@gmail.com'),
            currentAccountPicture: CircleAvatar(child: Icon(Icons.person, size: 40)),
          ),
          ListTile(
            leading: Icon(page[0].icon),
            title: Text(page[0].title),
            selected: selectedIndex == 0,
            onTap: (){
              changePage(0);
            }
          ),
          ListTile(
            leading: Icon(page[1].icon),
            title: Text(page[1].title),
            selected: selectedIndex == 1,
            onTap: (){
              changePage(1);
            }
          ),
          ListTile(
            leading: Icon(page[2].icon),
            title: Text(page[2].title),
            selected: selectedIndex == 2,
            onTap: (){
              changePage(2);
            }
          ),
          ListTile(
            leading: Icon(page[3].icon),
            title: Text(page[3].title),
            selected: selectedIndex == 3,
            onTap: (){
              changePage(3);
            }
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About'),
            onTap: (){
              Navigator.pop(context);
              showMessage('Flutter Drawer complited');
            }
          ),
        ],
      ),
    );
  }
  List<Widget> buildAppBarActions(){
    return[
      IconButton(
        onPressed: (){
          showMessage('Serach pressed');
        },
        icon: const Icon(Icons.search),
      ),
      IconButton(
        onPressed: (){
          showMessage('Notification pressed');
        },
        icon: const Icon(Icons.notifications)
      ),
    ];
  }
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(getCurrentTitle()),
        actions: buildAppBarActions(),

      ),
      drawer: buildDrawer(),
      body: getCurrentPage(),
    );
  }
}
import "package:flutter/material.dart";

void main(){
    runApp(const MyApp());
}
class MyApp extends StatelessWidget{
    const MyApp({super.key});
    Widget build(BuildContext context){
        List<String> skills = ['Flutter', 'Dart', 'Python'];
        return MaterialApp(
            debugShowCheckedModeBanner:false,
            title: 'Problem 3',
            home: Scaffold(
                appBar: AppBar(
                    title: const Text('Flutter problem 3')
                ),
                body: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                            const Center(
                                child: CircleAvatar(
                                    radius: 45,
                                    child: Icon(Icons.person, size:50),
                                ),
                            ),
                            const SizedBox(height: 20),
                            const Center(
                                child: Text(
                                    'Anuar',
                                    style: TextStyle(fontSize:18, ),
                                ),
                            ),
                            const SizedBox(height: 30),
                            Card(
                                child: Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Row(
                                        children: const[
                                            Icon(Icons.location_on, size: 20),
                                            SizedBox(width: 10),
                                            Text('Almaty, Kazakhstan'),
                                        ],
                                    ),
                                ),
                            ),
                            const SizedBox(height:20),
                            Card(
                                child: Padding(
                                    padding: const EdgeInsets.all(17),
                                    child: Row(
                                        children: const[
                                            Icon(Icons.email),
                                            SizedBox(width:10),
                                            Text('anuar@gmail.com', style: TextStyle(fontSize: 18)),
                                        ],
                                    ),
                                ),
                            ),
                            const SizedBox(height:40),
                            const Text('My skills:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 35),
                            Text('1. ${skills[0]}', style: const TextStyle(fontSize: 19 )),
                            Text('2. ${skills[1]}', style: const TextStyle(fontSize: 19 )),
                            Text('3. ${skills[2]}', style: const TextStyle(fontSize:19 )),
                            const SizedBox(height: 20),
                            Center(
                                child: ElevatedButton(
                                    onPressed: (){
                                        print('Profile pressed');
                                    },
                                    child: const Text('Open Profile'),
                                ),
                            ),
                            
                        ],
                    ),
                ),
            ),
        );
    }
}
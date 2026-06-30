import 'package:flutter/material.dart';
void main(){
  runApp(const StreamBuilderApp());
}
class StreamBuilderApp extends StatelessWidget{
  const StreamBuilderApp({super.key});
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Problem 28',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)
      ),
      home: const StreamHomePage(),
    );
  }
}
class StreamHomePage extends StatefulWidget{
  const StreamHomePage({super.key});
  State<StreamHomePage> createState(){
    return _StreamHomePageState();
  }
}
class _StreamHomePageState extends State<StreamHomePage>{
  late Stream<int> counterStream;
  void initState(){
    super.initState();
    counterStream = createCounterStream();
  }
  Stream<int> createCounterStream() async*{
    for(int i =1; i<=20; i++){
      await Future.delayed(const Duration(seconds: 1));
      yield i;
    }
  }
  void restartStream(){
    setState(() {
      counterStream = createCounterStream();
    });
  }
  Widget buildLoading(){
    return const Center(
      child: CircularProgressIndicator()
    );
  }
  Widget buildCounter(int value){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.timer, size: 70),
          const SizedBox(height: 20),
          const Text('Stream Counter', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Text(
            value == 20 ? 'Stream completed':'Counting...',
            style: const TextStyle(fontSize: 20),
          ),
        ],
        )
    );
  }
  Widget buildError(Object error){
    return Center(
      child: Text(
        'Error: $error', 
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
      )
    );  
  }
  Widget buildStreamBody(){
    return StreamBuilder<int>(
      stream: counterStream,
      builder: (context,  snapshot){
        if(snapshot.hasError){
          return buildError(snapshot.error!);
        }
        if(!snapshot.hasData){
          return buildLoading();
        }
        final value = snapshot.data!;
        return buildCounter(value);
      }
    );
  }
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Problem 28: StreamBuilder'),
        actions: [
          IconButton(onPressed: restartStream, icon: const Icon(Icons.refresh))
        ],
      ),
      body: buildStreamBody()
    );
  }
}
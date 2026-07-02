import 'dart:async';
import 'package:flutter/material.dart';
void main(){
    runApp(const StreamControllerApp());
}
class StreamControllerApp extends StatelessWidget{
    const StreamControllerApp({super.key});
    Widget build(BuildContext context){
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Problem 29',
            theme: ThemeData(
                useMaterial3: true,
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)
            ),
            home: const StreamControllerPage()
        );
    }
}
class StreamControllerPage extends StatefulWidget{
    const StreamControllerPage({super.key});
    State<StreamControllerPage> createState(){
        return _StreamControllerState();
    }
}
class _StreamControllerState extends State<StreamControllerPage>{
    final StreamController<int> counterController = StreamController<int>();
    int counter = 0;
    void initState(){
        super.initState();
        counterController.add(counter);
    }
    void increase(){
        counter++;
        counterController.add(counter);
    }
    void decrease(){
        counter--;
        counterController.add(counter);
    }
    void reset(){
        counter =0;
        counterController.add(counter);
    }
    void addError(){
        counterController.addError('Manual error');
    }
    void dispose(){
        counterController.close();
        super.dispose();
    }
    Widget buildCounter(int value){
        return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                const Icon(Icons.stream, size: 50),
                const SizedBox(height: 20),
                const Text('Counter something', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                Text('$value', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                Row(
                    children: [
                        Expanded(
                            child: ElevatedButton(
                                onPressed: decrease,
                                child: Text('-')
                            ),
                        ),
                        const SizedBox(width: 10,),
                        Expanded(
                            child: ElevatedButton(
                                onPressed: increase,
                                child: Text('+')
                            ),
                        ),
                        const SizedBox(height: 20),
                    ],
                ),
                Row(
                            children: [
                                Expanded(
                                    child: ElevatedButton(
                                    onPressed: reset,
                                    child: Text('reset', style: TextStyle(fontSize: 20))
                                    ),
                                ),
                                const SizedBox(height: 20),
                                Expanded(
                                    child: ElevatedButton(
                                        onPressed: addError,
                                        child: const Text('Add error')
                                    ),
                                ),
                            ],
                        ),
            ],
        );
    }
    Widget buildError(Object error){
        return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                const Icon(Icons.error, size: 50),
                const SizedBox(height: 20),
                Text(
                    'Error: $error',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: reset,
                    child: const Text('Refresh stream')
                ),
            ],
        );
    }
    Widget buildStreamBody(){
        return StreamBuilder<int>(
            stream: counterController.stream,
            initialData: counter,
            builder: (context, snapshot){
                if(snapshot.hasError){
                    return buildError(snapshot.error!);
                }
                if(!snapshot.hasData){
                    return const Center(
                        child: CircularProgressIndicator()
                    );
                }
                final value = snapshot.data!;
                return buildCounter(value);
            }
        );
    }
    Widget build(BuildContext context){
        return Scaffold(
            appBar: AppBar(title: Text('Problem 29: StreamController')),
            body: Padding(
                padding: const EdgeInsets.all(20),
                child: buildStreamBody()
            ),
        );
    }
}
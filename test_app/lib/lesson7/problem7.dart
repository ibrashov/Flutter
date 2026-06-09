import 'package:flutter/material.dart';
import 'package:test_app/lesson4/problem4.dart';
void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Problem 6',
      home: const LoginPage(),
    );
  }
}
class LoginPage extends StatefulWidget{
  const LoginPage({super.key});
  State<LoginPage> createState(){
    return _LoginPageState();
  }
}
class _LoginPageState extends State<LoginPage>{
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String result = 'Plese login';
  void login(){
    if(formKey.currentState!.validate()){
      setState((){
        result = 'Login succes\nemail: ${emailController.text}\nPassword: ${passwordController.text} ';
      });
      print('Email: ${emailController.text}');
      print('Passwoed: ${passwordController.text}');
    }else{
      setState(() {
        print('Plese fix the errors');
      });
    }
  }
  void clearForm(){
    setState(() {
      emailController.clear();
      passwordController.clear();
      result = 'Cleared';
    });
  }
  void dispose(){
    setState(() {
      emailController.dispose();
      passwordController.dispose();
      super.dispose();
    });
  }
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('Problem 7: Validation')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const Icon(Icons.lock, size: 70),
                const SizedBox(height: 20,),
                const Text('Login Form', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter email',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Plese enter your email';
                    }
                    if(!value.contains('@')){
                      return 'Eamil must contain @';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: passwordController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter password',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock)
                  ),
                  validator:(value){
                    if(value == null || value.isEmpty){
                      return 'Plese enter password';
                    }
                    if(value.length < 6){
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  }
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: login,
                        child: const Text('Login')
                      ),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: clearForm,
                        child: const Text('Clear')
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
                Text(
                      result, 
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
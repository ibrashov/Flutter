void main(){
  for(int i=0; i<5 ;i++){
    print('hello world ${i+1}');
  }
  String name = 'Anuar';
  print('My name is $name');

  bool isNight = true;
  print('It is night: $isNight');

  var name1 = 'Olzhas';
  name1 = 'Chertov';
  final name2 = 'Miras';
  const name3 = 'Serik';
  int num = 10;
  print('Now this number will be 11 ${num+1}');

  List<String> names = ['Anuar', 'Olzhas', 'Miras'];
  print(names[0]);
  print(names.length);
  names.add('Serik25');
  for(String name in names){
    print(name);
  }

  Map<String,String> person = {
    'name': 'Anuar',
    'age': '20',
    'city': 'Almaty',
  };
  print([person['name']]);
  person['name'] = 'Olzhas';

int agee = 18;
if(agee >=18){
  print('Adult');
}else{
  print('Minor');
}

bool isAlmasGay = true;
if(isAlmasGay){
  print('Yes he is');
}else{
  print('No he is not');
}

void sayHello(){
  print('Hello');
}

String text = getgreeting('Anuar');
print(text);
String getgreeting( String name){
  return 'Hello $name';
}


String? nameee = null;
if(nameee != null){
  print(nameee.length);
}else{
  print('Name is null');
}


Future<String> geData() async{
  await Future.delayed(Duration(seconds: 2));
  return 'Data received';
}



}

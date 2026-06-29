import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/dashboard_provider.dart';
class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});
  State<DashboardPage> createState(){
    return _DashBoardPageState();
  }
}
class _DashBoardPageState extends State<DashboardPage>{
  final nameController = TextEditingController();
  void dispose(){
    nameController.dispose();
    super.dispose();
  }
  Widget buildCounterCard(){
    return Selector<DashboardProvider, int>(
      selector: (context, provider){return provider.counter;},
      builder: (context, counter, child){
        print('CounterCard rebuilt');
        return Card(
          child: Padding(
            padding: const EdgeInsetsGeometry.all(16),
            child: Column(
              children: [
                const Icon(Icons.exposure_plus_1, size: 60),
                const SizedBox(height: 20),
                const Text('Counter', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                Text('$counter', style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: (){
                          context.read<DashboardProvider>().decrease();
                        },
                        child: const Text('-')
                      ),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: (){
                          context.read<DashboardProvider>().increase();
                        },
                        child: const Text('+'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: (){
                      context.read<DashboardProvider>().reset();
                    },
                    child: const Text('Reset'),
                  ),
                ),

              ],  

            ),
          ),
        );
      },
    );
  }
  Widget buildUserCard(){
    return Selector<DashboardProvider,String>(
      selector: (context, provider){return provider.username;},
      builder: (context, username, child){
        print('UserCard rebuilt');
        return Card(
          child: Padding(
            padding: const EdgeInsetsGeometry.all(16),
            child: Column(
              children: [
                const Icon(Icons.person, size: 60),
                const SizedBox(height: 20),
                const Text('User', style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                Text(username, style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'New user',
                    hintText: 'Enter username',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.edit)
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: (){
                      context.read<DashboardProvider>().changeUserName(nameController.text);
                      nameController.clear();
                    },
                    child: const Text('Change username'),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
  Widget buildPremiumCard(){
    return Selector<DashboardProvider, bool>(
      selector: (context, provider){return provider.isPremium;},
      builder: (context, isPremium, child){
        print('PremiumCard rebuild');
        return Card(
          child: SwitchListTile(
            value: isPremium,
            onChanged: (value){
              context.read<DashboardProvider>().togglePremium(value);
            },
            title: const Text('Premium Acc'),
            subtitle: Text(isPremium ? 'Premium is active' : 'Premium is not active'),
            secondary: Icon(isPremium? Icons.star: Icons.star_border),
          ),

        );
      }
    );
  }
  Widget buildSummaryCard() {
    return Selector<DashboardProvider, String>(
      selector: (context, provider) {
        return '${provider.username} | Counter: ${provider.counter} | Premium: ${provider.isPremium}';
      },
      builder: (context, summary, child) {
        print('SummaryCard rebuilt');

        return Card(
          child: ListTile(
            leading: const Icon(Icons.dashboard),
            title: const Text('Summary'),
            subtitle: Text(summary),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    print('DashboardPage build');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter 26: Selector'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          buildCounterCard(),
          buildUserCard(),
          buildPremiumCard(),
          buildSummaryCard(),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:singleton_design_pattern/user_preferences.dart';

// The main function of the application.
void main() async {
  // Ensures that you have an instance of the WidgetsBinding.
  // This is required if you need to access the binary messenger before `runApp()`
  // has been called (for example, during plugin initialization).
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize the UserPreferences singleton instance.
  // This is done before running the app to ensure that the preferences are
  // available to the application as soon as it starts.
  await UserPreferences.instance.init();

  // Run the app. The const keyword here means that the MyApp widget is
  // immutable and its configuration won't change over time.
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final userPreferences = UserPreferences.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('My username is: ${userPreferences.username}', style: Theme.of(context).textTheme.bodyMedium),
            ElevatedButton(onPressed: () {
              userPreferences.username = 'mdsarfaraj';
              setState(() {});
            }, child: const Text('Set Username')),
          ],
        ),
      ),
    );
  }
}

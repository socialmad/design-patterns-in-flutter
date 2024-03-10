import 'package:abstract_factory/app_abstract_factory.dart';
import 'package:flutter/material.dart';

void main() {
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

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Design Patterns'),
      ),
      body: Center(
        // Uses the AppAbstractFactoryImpl to create a platform-specific button
        child: AppAbstractFactoryImpl.platformAppButton(
          context: context,
          child: const Text('Show Alert Box'),
          onPressed: () {
            // Uses the AppAbstractFactoryImpl to show a platform-specific alert box
            AppAbstractFactoryImpl.platformAppAlertBox(context: context);
          },
        ),
      )
    );
  }
}

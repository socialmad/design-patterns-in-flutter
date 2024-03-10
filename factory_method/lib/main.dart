// Importing necessary Flutter packages
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Entry point of the Flutter application
void main() {
  runApp(const MyApp());
}

// MyApp is the root widget of the application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This method builds the widget tree for MyApp
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

// HomePage is the home screen of the application
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // This method builds the widget tree for HomePage
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Factory Method Example'),
      ),
      body: Center(
        child: AppButton(Theme.of(context).platform).build(
            context: context,
            child: const Text('Button'),
            onPressed: () {
              print("Button clicked");
            }),
      ),
    );
  }
}

// AppButton is an abstract class that defines a factory method for creating platform-specific buttons
abstract class AppButton {
  factory AppButton(TargetPlatform platform) {
    switch (platform) {
      case TargetPlatform.android:
        return AndroidButton();
      case TargetPlatform.iOS:
        return IOSButton();
      default:
        return AndroidButton();
    }
  }

  // This method builds the platform-specific button
  Widget build(
      {required BuildContext context,
        required Widget child,
        required VoidCallback onPressed});
}

// AndroidButton is a concrete implementation of AppButton for Android
class AndroidButton implements AppButton {
  @override
  Widget build(
      {required BuildContext context,
        required Widget child,
        required VoidCallback onPressed}) {
    return ElevatedButton(
      onPressed: onPressed,
      child: child,
    );
  }
}

// IOSButton is a concrete implementation of AppButton for iOS
class IOSButton implements AppButton {
  @override
  Widget build(
      {required BuildContext context,
        required Widget child,
        required VoidCallback onPressed}) {
    return CupertinoButton(
      onPressed: onPressed,
      child: child,
    );
  }
}
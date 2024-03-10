import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Abstract class AppAlertBox serves as a blueprint for creating platform-specific alert boxes
abstract class AppAlertBox {
  // Factory constructor that returns an instance of a concrete implementation of AppAlertBox based on the platform
  factory AppAlertBox(TargetPlatform platform) {
    switch (platform) {
      case TargetPlatform.android:
      // Returns AndroidAlertBox for Android platform
        return AndroidAlertBox();
      case TargetPlatform.iOS:
      // Returns IOSAlertBox for iOS platform
        return IOSAlertBox();
      default:
      // Returns AndroidAlertBox as a default alert box
        return AndroidAlertBox();
    }
  }

  // Abstract method show which will be implemented in concrete classes
  // It takes context as a parameter
  void show({required BuildContext context});
}

// AndroidAlertBox is a concrete implementation of AppAlertBox for Android
class AndroidAlertBox implements AppAlertBox {
  @override
  // Implementation of show method for Android platform
  // It shows a Material Design AlertDialog
  void show({required BuildContext context}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alert'),
          content: const Text('This is an Android alert box.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

// IOSAlertBox is a concrete implementation of AppAlertBox for iOS
class IOSAlertBox implements AppAlertBox {
  @override
  // Implementation of show method for iOS platform
  // It shows a Cupertino-style AlertDialog
  void show({required BuildContext context}) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text('Alert'),
          content: const Text('This is an iOS alert box.'),
          actions: <Widget>[
            CupertinoDialogAction(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Abstract class AppButton serves as a blueprint for creating platform-specific buttons
abstract class AppButton {
  // Factory constructor that returns an instance of a concrete implementation of AppButton based on the platform
  factory AppButton(TargetPlatform platform) {
    switch (platform) {
      case TargetPlatform.android:
      // Returns AndroidButton for Android platform
        return AndroidButton();
      case TargetPlatform.iOS:
      // Returns IOSButton for iOS platform
        return IOSButton();
      default:
      // Returns AndroidButton as a default button
        return AndroidButton();
    }
  }

  // Abstract method button which will be implemented in concrete classes
  // It takes context, child widget and onPressed callback as parameters
  Widget button({required BuildContext context, required Widget child, required VoidCallback onPressed});
}

// AndroidButton is a concrete implementation of AppButton for Android
class AndroidButton implements AppButton {
  @override
  // Implementation of button method for Android platform
  // It returns an ElevatedButton widget
  Widget button({required BuildContext context, required Widget child, required VoidCallback onPressed}) {
    return ElevatedButton(
      onPressed: onPressed,
      child: child,
    );
  }
}

// IOSButton is a concrete implementation of AppButton for iOS
class IOSButton implements AppButton {
  @override
  // Implementation of button method for iOS platform
  // It returns a CupertinoButton widget
  Widget button({required BuildContext context, required Widget child, required VoidCallback onPressed}) {
    return CupertinoButton(
      onPressed: onPressed,
      child: child,
    );
  }
}
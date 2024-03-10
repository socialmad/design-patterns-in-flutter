import 'package:abstract_factory/app_alert_box.dart';
import 'package:abstract_factory/app_button.dart';
import 'package:flutter/material.dart';

// Class AppAbstractFactoryImpl provides static methods to create platform-specific UI elements
class AppAbstractFactoryImpl {
  // Static method platformAppButton creates a platform-specific button
  // It uses the AppButton factory to create a button based on the platform
  // The button is created with the provided context, child widget, and onPressed callback
  static Widget platformAppButton({required BuildContext context, required Widget child, required VoidCallback onPressed}) {
    return AppButton(Theme.of(context).platform)
        .button(context: context, child: child, onPressed: onPressed);
  }

  // Static method platformAppAlertBox shows a platform-specific alert box
  // It uses the AppAlertBox factory to create an alert box based on the platform
  // The alert box is shown in the provided context
  static void platformAppAlertBox({required BuildContext context}) {
    AppAlertBox(Theme.of(context).platform).show(context: context);
  }
}
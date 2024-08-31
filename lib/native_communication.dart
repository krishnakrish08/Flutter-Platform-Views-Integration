import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NativeCommunication {
  static const platform =
      MethodChannel('com.example.platform.views.integration/login');

  Future<void> login() async {
    try {
      final Map<Object?, Object?> result = await platform.invokeMethod('login');

      debugPrint('result -- $result');

      String? username = result['username'] as String?;
      String? password = result['password'] as String?;

      debugPrint('Username: $username, Password: $password');
    } on PlatformException catch (e) {
      debugPrint("Failed to get login parameters: '${e.message}'.");
    }
  }

  ///This example used for login activity - platform view integration
  Future<void> openLoginScreen() async {
    try {
      final result = await platform.invokeMethod('openLogin');
      debugPrint(
          "Login Data: $result"); // Expecting a Map with username and password.
    } on PlatformException catch (e) {
      debugPrint("Failed to open login screen: '${e.message}'.");
    }
  }
}

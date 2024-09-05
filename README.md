# flutter_platform_views_integration

This Project is used to create native platform view and integrate in Android and iOS.

We can view the UI is respective platforms. 

## ToDo:
1. Need to fix communication from native to dart


..........................................................................................................................

## Difference between Method Chanel and Platform Channel

Method Channel: This is a specific type of Platform Channel used to communicate between Flutter and the host platform (iOS or Android) using method calls. It allows you to invoke methods on the native side and get results back.

Platform Channel: This is a broader term that encompasses different types of channels used for communication between Flutter and the host platform. Method Channel is one type of Platform Channel. Other types include BasicMessageChannel and EventChannel.
Now, let's dive deeper into each:

Method Channel
Purpose: Used for invoking methods on the native side and receiving results.
Example Use Case: Calling a native API to get battery level.
How It Works: You define a MethodChannel in your Flutter code and use it to send method calls to the native side. The native side listens for these calls and responds accordingly.

Platform Channel
Purpose: General term for communication channels between Flutter and the host platform.

Types:
MethodChannel: For method calls.
BasicMessageChannel: For sending and receiving messages.
EventChannel: For streaming data from the native side to Flutter.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

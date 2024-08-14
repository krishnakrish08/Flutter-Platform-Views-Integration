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
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Native Views'),
        ),
        body: Center(
          child: AndroidView(
            viewType: 'my_custom_text_view',
            onPlatformViewCreated: _onPlatformViewCreated,
          ),
        ),
      ),
    );
  }

  void _onPlatformViewCreated(int id) {
    // Handle the view creation if required.
    debugPrint('Platform View Created $id');
  }
}

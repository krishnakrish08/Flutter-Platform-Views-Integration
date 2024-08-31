import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';

class PlatformView extends StatelessWidget {
  const PlatformView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Platform View Integration'),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          height: 200,
          width: 200,
          child: Platform.isAndroid
              ? const AndroidView(
                  viewType: 'native-view',
                  creationParams: <String, dynamic>{},
                  creationParamsCodec: StandardMessageCodec(),
                )
              : const UiKitView(
                  viewType: 'native-view',
                  creationParams: <String, dynamic>{},
                  creationParamsCodec: StandardMessageCodec(),
                ),
        ),
      ),
    );
  }
}

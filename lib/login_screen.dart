import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import 'package:flutter_platform_views_integration/native_communication.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      body: Column(
        children: [
          Expanded(
            child: PlatformViewLink(
              viewType: 'login-view',
              surfaceFactory: (context, controller) {
                return AndroidViewSurface(
                  controller: controller as AndroidViewController,
                  gestureRecognizers: const <Factory<
                      OneSequenceGestureRecognizer>>{},
                  hitTestBehavior: PlatformViewHitTestBehavior.opaque,
                );
              },
              onCreatePlatformView: (params) {
                return PlatformViewsService.initSurfaceAndroidView(
                  id: params.id,
                  viewType: 'login-view',
                  layoutDirection: TextDirection.ltr,
                  creationParams: <String, dynamic>{},
                  creationParamsCodec: const StandardMessageCodec(),
                )
                  ..addOnPlatformViewCreatedListener(
                      params.onPlatformViewCreated)
                  ..create();
              },
            ),
          ),

          /// Another type of example
          /*Expanded(
            child: Platform.isAndroid
                ? const AndroidView(
                    viewType: 'login-view',
                  )
                : const UiKitView(
                    viewType: 'login-view',
                  ),
          ),*/
          ElevatedButton(
            onPressed: () async {
              NativeCommunication nativeCommunication = NativeCommunication();
              await nativeCommunication.login();
            },
            child: const Text('Get Login Parameters'),
          ),
        ],
      ),
    );
  }
}

///For IOS
class IOSLoginView extends StatelessWidget {
  static const platform = MethodChannel('loginChannel');

  const IOSLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: 300,
      child: UiKitView(
        viewType: 'loginView',
        creationParams: const <String, dynamic>{},
        creationParamsCodec: const StandardMessageCodec(),
        onPlatformViewCreated: (int id) {
          platform.setMethodCallHandler((call) async {
            if (call.method == 'login') {
              String username = call.arguments['username'];
              String password = call.arguments['password'];
              // Handle login logic here
              print('Login successful for user: $username');
            }
          });
        },
      ),
    );
  }
}

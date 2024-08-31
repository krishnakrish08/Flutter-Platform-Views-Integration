package com.example.platform.views.integration.flutter_platform_views_integration.flutter_platform_views_integration

import android.app.Activity.RESULT_OK
import android.content.Intent
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant
import java.util.Arrays


class MainActivity: FlutterActivity() {

    private val CHANNEL = "com.example.platform.views.integration/login"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        //TextView Example
        /*flutterEngine
            .platformViewsController
            .registry
            .registerViewFactory("native-view", NativeViewFactory())*/

        val methodChannel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)

        // Set the method call handler to handle method calls from Flutter
        methodChannel.setMethodCallHandler { call, result ->
            if (call.method == "login") {
                val username = call.argument<String>("username")
                val password = call.argument<String>("password")

                //TODO -- Currently getting null values for username and password
                //FixMe -- get values of username and password
                println("username -- $username")
                println("password -- $password")

                // Handle login logic here
                result.success(HashMap<String, String>())
            } else {
                result.notImplemented()
            }
        }

        flutterEngine.platformViewsController.registry
            .registerViewFactory("login-view", LoginViewFactory(methodChannel))
    }
}

/// This example is used for login activity - android - platform view integration
/*
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodCall

class MainActivity : FlutterActivity() {
    fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(
            flutterEngine.getDartExecutor().getBinaryMessenger(),
            "com.yourcompany.loginscreen/login"
        )
            .setMethodCallHandler { call, result ->
                if (call.method.equals("openLogin")) {
                    val intent: Intent = Intent(this, LoginActivity::class.java)
                    startActivityForResult(
                        intent,
                        MainActivity.Companion.LOGIN_ACTIVITY_REQUEST_CODE
                    )
                } else {
                    result.notImplemented()
                }
            }
    }

    protected fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent) {
        super.onActivityResult(requestCode, resultCode, data)

        if (requestCode == MainActivity.Companion.LOGIN_ACTIVITY_REQUEST_CODE) {
            if (resultCode == RESULT_OK) {
                val username = data.getStringExtra("username")
                val password = data.getStringExtra("password")
                // Send result back to Flutter
                platformChannel.invokeMethod("loginResult", Arrays.asList(username, password))
            }
        }
    }

    companion object {
        private const val LOGIN_ACTIVITY_REQUEST_CODE = 1
    }
}
*/

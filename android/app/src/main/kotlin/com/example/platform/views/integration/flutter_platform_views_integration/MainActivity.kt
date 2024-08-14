package com.example.platform.views.integration.flutter_platform_views_integration

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugins.GeneratedPluginRegistrant;
import io.flutter.plugin.platform.PlatformViewRegistry;

class MainActivity : FlutterActivity() {


    @RequiresApi(Build.VERSION_CODES.N)
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        flutterEngine.getPlatformViewsController().getRegistry()
            .registerViewFactory("my_custom_text_view", NativeViewFactory())
    }
}

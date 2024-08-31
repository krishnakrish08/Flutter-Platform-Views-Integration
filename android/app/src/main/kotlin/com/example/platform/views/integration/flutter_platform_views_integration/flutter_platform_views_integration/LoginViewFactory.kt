package com.example.platform.views.integration.flutter_platform_views_integration.flutter_platform_views_integration

import android.content.Context
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.common.MethodChannel


class LoginViewFactory(private val methodChannel: MethodChannel) :
    PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    override fun create(context: Context, viewId: Int, args: Any?): PlatformView {
        return LoginView(context, methodChannel)
    }
}
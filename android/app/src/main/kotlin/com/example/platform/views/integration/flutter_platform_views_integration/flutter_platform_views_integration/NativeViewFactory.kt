package com.example.platform.views.integration.flutter_platform_views_integration.flutter_platform_views_integration

import android.graphics.Color
import android.content.Context
import android.view.View
import android.widget.TextView
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory
import io.flutter.plugin.common.StandardMessageCodec

class NativeViewFactory : PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    override fun create(context: Context, id: Int, args: Any?): PlatformView {
        return NativeView(context)
    }
}

class NativeView(context: Context) : PlatformView {
    /*private val view: View = View(context).apply {
        setBackgroundColor(0xFFFF0000.toInt()) // Red background
        layoutParams = FrameLayout.LayoutParams(200, 200) // Set size to 200x200
    }*/

    private val textView: TextView = TextView(context).apply {
        text = "Hello from Android"
        setTextColor(Color.WHITE)
        setBackgroundColor(0xFFFF0000.toInt()) // Red background
        textSize = 20f // Optional: Set text size
    }

    override fun getView(): View {
        return textView
    }

    override fun dispose() {}
}
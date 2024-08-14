package com.example.platform.views.integration.flutter_platform_views_integration

import android.content.Context
import android.graphics.Color
import androidx.appcompat.widget.AppCompatTextView

class MyCustomTextView(context: Context) : AppCompatTextView(context) {
    init {
        text = "This is a native text view."
        textSize = 20f
        setTextColor(Color.BLACK)
    }
}
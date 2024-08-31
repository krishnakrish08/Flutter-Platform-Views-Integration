package com.example.platform.views.integration.flutter_platform_views_integration.flutter_platform_views_integration

import android.content.Context
import android.view.LayoutInflater
import android.view.View
import android.widget.Button
import android.widget.EditText
import android.widget.LinearLayout
import android.widget.Toast
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.platform.PlatformView


class LoginView(context: Context, private val methodChannel: MethodChannel) : PlatformView {
    private val layout: LinearLayout
    private val username: EditText
    private val password: EditText
    private val loginButton: Button

    init {
        val inflater = LayoutInflater.from(context)
        layout = inflater.inflate(R.layout.login_view, null) as LinearLayout
        username = layout.findViewById(R.id.username)
        password = layout.findViewById(R.id.password)
        loginButton = layout.findViewById(R.id.login_button)

        loginButton.setOnClickListener {
            val usernameValue = username.text.toString()
            val passwordValue = password.text.toString()
            Toast.makeText(context, "Username: $usernameValue, Password: $passwordValue", Toast.LENGTH_SHORT).show()
            //methodChannel.invokeMethod("login", mapOf("username" to usernameValue, "password" to passwordValue))
            methodChannel.invokeMethod("login", login(usernameValue, passwordValue))
        }
    }

    private fun login(username: String, password: String): Map<String, String> {
        val arguments: MutableMap<String, String> = HashMap()
        arguments["username"] = username
        arguments["password"] = password
        return arguments
    }

    override fun getView(): View {
        return layout
    }

    override fun dispose() {}
}
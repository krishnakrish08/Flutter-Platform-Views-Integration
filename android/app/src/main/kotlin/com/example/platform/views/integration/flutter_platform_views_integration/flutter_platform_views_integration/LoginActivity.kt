package com.example.platform.views.integration.flutter_platform_views_integration.flutter_platform_views_integration

import android.app.Activity
import android.content.Intent
import android.os.Bundle
import android.view.View
import android.widget.Button
import android.widget.EditText

/**
 * Another type of example for platform view Integration - Android
 **/
class LoginActivity : Activity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.login_view)

        val usernameEditText = findViewById<EditText>(R.id.username)
        val passwordEditText = findViewById<EditText>(R.id.password)
        val loginButton = findViewById<Button>(R.id.login_button)

        loginButton.setOnClickListener { view: View? ->
            val intent = Intent()
            intent.putExtra("username", usernameEditText.text.toString())
            intent.putExtra("password", passwordEditText.text.toString())
            setResult(RESULT_OK, intent)
            finish()
        }
    }
}
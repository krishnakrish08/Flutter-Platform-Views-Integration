import Flutter
import UIKit

class LoginViewFactory: NSObject, FlutterPlatformViewFactory {
  func create(
    withFrame frame: CGRect,
    viewIdentifier viewId: Int64,
    arguments args: Any?
  ) -> FlutterPlatformView {
    return LoginView(frame)
  }
}

class LoginView: NSObject, FlutterPlatformView {
  let frame: CGRect
  let usernameTextField: UITextField
  let passwordTextField: UITextField
  let loginButton: UIButton

  init(_ frame: CGRect) {
    self.frame = frame
    self.usernameTextField = UITextField(frame: CGRect(x: 0, y: 0, width: frame.width, height: 40))
    self.passwordTextField = UITextField(frame: CGRect(x: 0, y: 50, width: frame.width, height: 40))
    self.loginButton = UIButton(type: .system)
    super.init()
  }

  func view() -> UIView {
    let view = UIView(frame: frame)

    usernameTextField.placeholder = "Username"
    passwordTextField.placeholder = "Password"
    passwordTextField.isSecureTextEntry = true
    loginButton.frame = CGRect(x: 0, y: 100, width: frame.width, height: 40)
    loginButton.setTitle("Login", for: .normal)

    loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)

    view.addSubview(usernameTextField)
    view.addSubview(passwordTextField)
    view.addSubview(loginButton)

    return view
  }

  @objc func loginButtonTapped() {
    let username = usernameTextField.text ?? ""
    let password = passwordTextField.text ?? ""

    let channel = FlutterMethodChannel(name: "loginChannel", binaryMessenger: (UIApplication.shared.delegate as! FlutterAppDelegate).window.rootViewController as! FlutterBinaryMessenger)
    channel.invokeMethod("login", arguments: ["username": username, "password": password])
  }
}

/*class LoginViewFactory: NSObject, FlutterPlatformViewFactory {
    func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView {
        return LoginView(frame)
    }
}

class LoginView: NSObject, FlutterPlatformView {
    private var _view: UIView

    init(_ frame: CGRect) {
        _view = UIView(frame: frame)
        super.init()
        createLoginView()
    }

    func view() -> UIView {
        return _view
    }

    private func createLoginView() {
        let username = UITextField(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        username.placeholder = "Username"
        _view.addSubview(username)

        let password = UITextField(frame: CGRect(x: 0, y: 50, width: 200, height: 40))
        password.placeholder = "Password"
        password.isSecureTextEntry = true
        _view.addSubview(password)

        let loginButton = UIButton(frame: CGRect(x: 0, y: 100, width: 200, height: 40))
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.blue, for: .normal)
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        _view.addSubview(loginButton)
    }

    @objc private func loginButtonTapped() {
        print("Login button tapped")
    }
}*/


/*
import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""

    var body: some View {
        VStack {
            TextField("Username", text: $username)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5.0)
                .padding(.bottom, 20)

            SecureField("Password", text: $password)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5.0)
                .padding(.bottom, 20)

            Button(action: {
                // Handle login logic here
            }) {
                Text("Login")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(5.0)
            }
        }
        .padding()
    }
}*/

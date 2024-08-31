import UIKit
import Flutter

/**
 * Another type of example for platform view Integration - ios
 **/
class LoginViewController: UIViewController {
    private var result: FlutterResult?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white

        // Username Field
        let usernameTextField = UITextField(frame: CGRect(x: 20, y: 100, width: 300, height: 40))
        usernameTextField.placeholder = "Enter username"
        usernameTextField.borderStyle = .roundedRect

        // Password Field
        let passwordTextField = UITextField(frame: CGRect(x: 20, y: 150, width: 300, height: 40))
        passwordTextField.placeholder = "Enter password"
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.isSecureTextEntry = true

        // Login Button
        let loginButton = UIButton(type: .system)
        loginButton.frame = CGRect(x: 20, y: 200, width: 300, height: 40)
        loginButton.setTitle("Login", for: .normal)
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)

        self.view.addSubview(usernameTextField)
        self.view.addSubview(passwordTextField)
        self.view.addSubview(loginButton)
    }

    @objc func loginButtonTapped() {
        // Dismiss the view controller and send data back to Flutter
        let username = "SampleUsername"  // Collect from usernameTextField
        let password = "SamplePassword"  // Collect from passwordTextField
        navigationController?.popViewController(animated: true)
        result?(["username": username, "password": password])
    }

    func setFlutterResult(_ result: @escaping FlutterResult) {
        self.result = result
    }
}
import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    //Text Example
    /*let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
            let registrar = controller.registrar(forPlugin: "native-view")
            let factory = NativeViewFactory()
            registrar.register(factory, withId: "native-view")*/

    /*let factory = LoginViewFactory()
            registrar(forPlugin: "loginView")?.register(factory, withId: "loginView")*/

    //LoginExample
    let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
            let registrar = controller.registrar(forPlugin: "login-view")
            let factory = LoginViewFactory()
            registrar.register(factory, withId: "login-view")

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}


/// This example is used for login activity - ios - platform view integration
/*
import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  private var methodChannel: FlutterMethodChannel?

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
    methodChannel = FlutterMethodChannel(name: "com.yourcompany.loginscreen/login",
                                         binaryMessenger: controller.binaryMessenger)

    methodChannel?.setMethodCallHandler({
      [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
      // Handle call from Flutter
      if call.method == "openLogin" {
        self?.showLoginScreen(result: result)
      } else {
        result(FlutterMethodNotImplemented)
      }
    })

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  private func showLoginScreen(result: @escaping FlutterResult) {
    if let viewController = window?.rootViewController {
      let loginVC = LoginViewController()
      loginVC.setFlutterResult(result)
      viewController.show(loginVC, sender: self)
    }
  }
}
*/

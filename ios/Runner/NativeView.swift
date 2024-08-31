import Flutter
import UIKit

class NativeViewFactory: NSObject, FlutterPlatformViewFactory {
    func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView {
        return NativeView(frame)
    }
}

class NativeView: NSObject, FlutterPlatformView {
    let frame: CGRect

    init(_ frame: CGRect) {
        self.frame = frame
    }

    func view() -> UIView {
        let view = UIView(frame: frame)
        view.backgroundColor = UIColor.red
        return view
    }
}
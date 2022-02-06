import UIKit

final class ShakeableWindow: UIWindow {
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake,
            let topViewController = topViewController,
            !(topViewController is DeviceSizeListViewController) {
            topViewController.present(DeviceSizeListViewController(), animated: true, completion: nil)
        }
    }
}

extension UIWindow {
    var topViewController: UIViewController? {
        if let presented = rootViewController?.presentedViewController {
            return presented
        } else if let nav = rootViewController as? UINavigationController {
            return nav.visibleViewController
        } else if let tab = rootViewController as? UITabBarController {
            return tab.selectedViewController
        } else {
            return rootViewController
        }
    }
}

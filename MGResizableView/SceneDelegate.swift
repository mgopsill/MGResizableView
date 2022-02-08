import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = ShakeableWindow(windowScene: windowScene)
        self.window = window
        self.window?.rootViewController = TestViewController()
        self.window?.makeKeyAndVisible()
    }
}

/* Known Issues:
- not taking into account safe area layout guide
  e.g. notch or time, date, wifi bar on iPhone 5 / 8
*/

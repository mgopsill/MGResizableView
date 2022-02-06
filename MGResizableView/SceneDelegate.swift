import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = ShakeableWindow(windowScene: windowScene)
        self.window = window
        let tab = UITabBarController()
        tab.viewControllers = [TestViewController()]
        tab.tabBar.backgroundColor = .black
        self.window?.rootViewController = tab
        self.window?.makeKeyAndVisible()
    }
}

/* Known Issues:
- not taking into account safe area layout guide
  e.g. notch or time, date, wifi bar on iPhone 5 / 8 
*/

//
//  SceneDelegate.swift
//  RSS Reader
//
//  Created by Kirill Atrakhimovich on 1.02.23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
               
        window = UIWindow(frame: UIScreen.main.bounds)
      
        window?.rootViewController = createRootController()
        window?.makeKeyAndVisible()
        window?.windowScene = windowScene
    }
    
    private func createRootController() -> UINavigationController {
        let navController = UINavigationController()
        let home = NewsViewController(networkManager: NetworkManager())
        navController.viewControllers = [home]
        return navController
    }
    
}


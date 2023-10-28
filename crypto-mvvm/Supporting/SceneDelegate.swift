//
//  SceneDelegate.swift
//  crypto-mvvm
//
//  Created by Dwiki Dwiki on 25/10/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = UINavigationController(rootViewController: HomeController())
        self.window = window
        self.window?.makeKeyAndVisible()
    }


}

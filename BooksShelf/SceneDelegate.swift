//
//  SceneDelegate.swift
//  BooksShelf
//
//  Created by Алексей Колыченков on 11.09.2025.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Ловим уведомление о смене состояния приложения
        NotificationCenter.default.addObserver(self, selector: #selector(appStateChange(notify:)), name: .stateDidChange, object: nil)
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    @objc func appStateChange(notify: Notification) {
        
    }

}


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
        
        guard let winScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: winScene)
        window?.rootViewController = PreviewView()
        window?.makeKeyAndVisible()
    }

    @objc func appStateChange(notify: Notification) {
        guard let userInfo = notify.userInfo as? [String: AppState],
              let appState = userInfo[.notifyInfo] else { return }
        
        switch appState {
        case .registration: self.window?.rootViewController = Builder.createRegistrationVC()
        case .onboarding: self.window?.rootViewController = Builder.createOnboardingVC()
        case .main: self.window?.rootViewController = Builder.createMainVC()
        }
    }
}


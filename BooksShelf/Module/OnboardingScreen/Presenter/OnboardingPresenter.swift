//
//  OnboardingPresenter.swift
//  BooksShelf
//
//  Created by Алексей Колыченков on 16.09.2025.
//

import Foundation
import UIKit
protocol OnboardingPresenterProtocol: AnyObject {
    var mockData: [OnboardingData] {get}
    init(view: any OnboardingViewProtocol)
    func startApp()
}

final class OnboardingPresenter: OnboardingPresenterProtocol {
    var mockData: [OnboardingData] = OnboardingData.mockData
    
    weak var view: (any OnboardingViewProtocol)?
    
    required init(view: any OnboardingViewProtocol) {
        self.view = view
    }
    
    func startApp() {
        UserDefaults.standard.set(AppState.main.rawValue, forKey: String.appState) 
        NotificationCenter.default.post(name: .stateDidChange, object: nil, userInfo: [String.notifyInfo: AppState.main])
    }
    
    deinit {
        print("OnboardingPresenter deinit")
    }
}

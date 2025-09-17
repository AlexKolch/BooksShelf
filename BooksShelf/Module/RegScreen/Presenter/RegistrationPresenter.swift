//
//  RegistrationPresenter.swift
//  BooksShelf
//
//  Created by Алексей Колыченков on 14.09.2025.
//

import Foundation

protocol RegistPresenterProtocol: AnyObject {
    func checkName(_ name: String) throws
    init(view: any RegistViewProtocol)
}

final class RegistrationPresenter: RegistPresenterProtocol {
    enum RegistrationError: String, Error {
        case nameTooShort = "Имя пользователя должно быть не менее 2х символов"
    }
    
    @Published var isRegistError = false
    weak var view: (any RegistViewProtocol)?
    
    
    init(view: any RegistViewProtocol) {
        self.view = view
    }
    
    
    func checkName(_ name: String) throws(RegistrationError) {
        if name.count >= 2 {
            UserDefaults.standard.set(name, forKey: "name")
            NotificationCenter.default.post(name: .stateDidChange, object: nil, userInfo: [String.notifyInfo: AppState.onboarding])
        } else {
            isRegistError = true
            throw .nameTooShort
        }
    }
}

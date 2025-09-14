//
//  RegistrationPresenter.swift
//  BooksShelf
//
//  Created by Алексей Колыченков on 14.09.2025.
//

import Foundation

protocol RegistPresenterProtocol: AnyObject {
    init(view: any RegistVCProtocol)
}

final class RegistrationPresenter: RegistPresenterProtocol {
    
    weak var view: (any RegistVCProtocol)?
    
    init(view: any RegistVCProtocol) {
        self.view = view
    }
    
    
}

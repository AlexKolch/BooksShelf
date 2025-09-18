//
//  MainViewPresenter.swift
//  BooksShelf
//
//  Created by Алексей Колыченков on 18.09.2025.
//

import Foundation

protocol MainViewPresenterProtocol: AnyObject {
    var name: String {get}
    init(view: any MainViewProtocol)
}

final class MainPresenter: MainViewPresenterProtocol {
    var name: String = "User"
    weak var view: (any MainViewProtocol)?
    
    init(view: any MainViewProtocol) {
        self.view = view
        guard let name = UserDefaults.standard.string(forKey: "name") else { return }
        self.name = name
    }
    
    
}

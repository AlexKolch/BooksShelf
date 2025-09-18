//
//  MainViewPresenter.swift
//  BooksShelf
//
//  Created by Алексей Колыченков on 18.09.2025.
//

import Foundation

protocol MainViewPresenterProtocol: AnyObject {
    init(view: any MainViewProtocol)
}

final class MainPresenter: MainViewPresenterProtocol {
    weak var view: (any MainViewProtocol)?
    
    init(view: any MainViewProtocol) {
        self.view = view
    }
    
    
}

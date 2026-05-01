//
//  BooksListPresenter.swift
//  BooksShelf
//
//  Created by Алексей Колыченков on 01.05.2026.
//

import Foundation

protocol BooksListPresenterProtocol: AnyObject {
    
}

final class BooksListPresenter: BooksListPresenterProtocol {
    weak var view: (any BooksListViewProtocol)?
    
    init(view: any BooksListViewProtocol) {
        self.view = view
    }
}

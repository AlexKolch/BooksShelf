//
//  BooksListPresenter.swift
//  BooksShelf
//
//  Created by Алексей Колыченков on 01.05.2026.
//

import Foundation

protocol BooksListPresenterProtocol: AnyObject {
    var booksList: [DtoBook]? { get }
}

final class BooksListPresenter: BooksListPresenterProtocol {
   private(set) var booksList: [DtoBook]?
    
    weak var view: (any BooksListViewProtocol)?
    
    init(view: any BooksListViewProtocol, books: [DtoBook]?) {
        self.view = view
        self.booksList = books
    }
}

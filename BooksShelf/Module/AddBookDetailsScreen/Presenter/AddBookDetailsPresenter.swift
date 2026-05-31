//
//  AddBookDetailsPresenter.swift
//  BooksShelf
//
//  Created by Алексей Колыченков on 01.05.2026.
//
import Foundation

protocol AddBookDetailsPresenterProtocol: AnyObject {
    var book: DtoBook {get set}
}

final class AddBookDetailsPresenter: AddBookDetailsPresenterProtocol {
    var book: DtoBook
    
    weak var view: (any AddBookDetailsVCProtocol)?
    
    init(view: any AddBookDetailsVCProtocol, book: DtoBook) {
        self.view = view
        self.book = book
    }
}

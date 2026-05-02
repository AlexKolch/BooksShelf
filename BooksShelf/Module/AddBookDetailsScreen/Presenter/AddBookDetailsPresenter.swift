//
//  AddBookDetailsPresenter.swift
//  BooksShelf
//
//  Created by Алексей Колыченков on 01.05.2026.
//
import Foundation

protocol AddBookDetailsPresenterProtocol: AnyObject {
    
}

final class AddBookDetailsPresenter: AddBookDetailsPresenterProtocol {
    weak var view: (any AddBookDetailsVCProtocol)?
    
    init(view: any AddBookDetailsVCProtocol) {
        self.view = view
    }
}

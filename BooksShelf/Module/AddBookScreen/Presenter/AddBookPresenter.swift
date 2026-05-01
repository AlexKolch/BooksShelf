//
//  AddBookPresenter.swift
//  BooksShelf
//
//  Created by Алексей Колыченков on 08.02.2026.
//

import Foundation

// Note: AddBookViewProtocol must be class-constrained (e.g., AddBookViewProtocol: AnyObject) 
// to allow weak references. Assuming this is declared elsewhere.

protocol AddBookPresenterProtocol: AnyObject {
    
}

final class AddBookPresenter: AddBookPresenterProtocol {
    weak var view: (any AddBookViewProtocol)?
    
    init(view: any AddBookViewProtocol) {
        self.view = view
    }
}

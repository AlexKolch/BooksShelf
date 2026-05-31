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
    func search(by title: String)
}

final class AddBookPresenter: AddBookPresenterProtocol {
    weak var view: (any AddBookViewProtocol)?
    private let repository: NetworkService
    
    init(view: any AddBookViewProtocol, repository: NetworkService = BookRepository()) {
        self.view = view
        self.repository = repository
    }
    
    func search(by title: String) {
        repository.get(by: title) { [weak self] res in
            switch res {
            case .success(let success):
                DispatchQueue.main.async {
                    self?.view?.routeForward(success)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}

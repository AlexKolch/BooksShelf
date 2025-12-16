//
//  DetailsPresenter.swift
//  BooksShelf
//
//  Created by Алексей Колыченков on 07.12.2025.
//

import Foundation

protocol DetailsPresenterProtocol: AnyObject {
    
}

final class DetailsPresenter: DetailsPresenterProtocol {
    weak var view: (any DetailsViewProtocol)?
    
    init(view: (any DetailsViewProtocol)? = nil) {
        self.view = view
    }
}

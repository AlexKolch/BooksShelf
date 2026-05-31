//
//  AddBookVC.swift
//  BooksShelf
//
//  Created by Алексей Колыченков on 08.02.2026.
//

import UIKit
import SwiftUI

protocol AddBookViewProtocol: BaseViewProtocol {
    var routeForward: (([DtoBook]) -> Void) { get }
//    func goToBooksList(books: [DtoBook])
}

final class AddBookVC: UIViewController, AddBookViewProtocol {
//    func goToBooksList(books: [DtoBook]) {
//        let vc = Builder.createBooksListVC(books: books)
//        navigationController?.pushViewController(vc, animated: true)
//    }
    
   lazy var routeForward: (([DtoBook]) -> Void) = { [weak self] books in
       let vc = Builder.createBooksListVC(books: books)
       self?.navigationController?.pushViewController(vc, animated: true)
    }
    
    typealias PresenterType = AddBookPresenterProtocol
    var presenter: (any PresenterType)?
   
    private lazy var routingHandler: (AddBookView.Route) -> Void = { [weak self] route in
        switch route {
        case .forward(let book):
            if book.count > 2 {
                self?.presenter?.search(by: book)
            }
        case .back:
            self?.navigationController?.popViewController(animated: true)
        }
    }
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let contentView = AddBookView(routeHandler: routingHandler)
        let contentVC = UIHostingController(rootView: contentView)
        self.add(contentVC)
    }
    
}

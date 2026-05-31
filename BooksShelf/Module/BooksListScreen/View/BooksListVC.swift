//
//  BooksListVC.swift
//  BooksShelf
//
//  Created by Алексей Колыченков on 01.05.2026.
//

import UIKit
import SwiftUI

protocol BooksListViewProtocol: BaseViewProtocol {
    
}

final class BooksListVC: UIViewController, BooksListViewProtocol {
    typealias PresenterType = BooksListPresenterProtocol
    
    var presenter: (any PresenterType)?

    override func viewDidLoad() {
        super.viewDidLoad()

        let contentView = BookListView(booksList: presenter?.booksList ?? [],
                                       cellTapped: { [weak self] book in
            if let book {
                let vc = Builder.createAddBookDetailsVC(book: book)
                self?.navigationController?.pushViewController(vc, animated: true)
            } else {
                self?.navigationController?.popViewController(animated: true)
            }
        })
        let contentVC = UIHostingController(rootView: contentView)
        self.add(contentVC)
    }
    

 

}

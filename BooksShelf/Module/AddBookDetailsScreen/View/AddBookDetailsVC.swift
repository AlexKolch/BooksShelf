//
//  AddBookDetailsVC.swift
//  BooksShelf
//
//  Created by Алексей Колыченков on 01.05.2026.
//

import UIKit
import SwiftUI

protocol AddBookDetailsVCProtocol: BaseViewProtocol {
    
}

protocol AddBookDetailsDelegate: AnyObject {
    func saveBook()
    func back()
    func createDescrBook(title: String, completion: @escaping (String) -> Void)
}

final class AddBookDetailsVC: UIViewController, AddBookDetailsVCProtocol {
    typealias PresenterType = AddBookDetailsPresenterProtocol
    var presenter: (any PresenterType)?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let contentView = AddBookDetailsView(book: presenter?.book, delegate: self)

        let contentVC = UIHostingController(rootView: contentView)
        self.add(contentVC)
    }

}

extension AddBookDetailsVC: AddBookDetailsDelegate {
    func saveBook() {
        print("save")
    }
    
    func back() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func createDescrBook(title: String, completion: @escaping (String) -> Void) {
        GigaChat.shared.sendRequest(bookName: title) { res in
            switch res {
            case .success(let descrpt):
              completion(descrpt)
            case .failure(let failure):
                print("\(failure.localizedDescription)")
            }
        }
    }
    
}

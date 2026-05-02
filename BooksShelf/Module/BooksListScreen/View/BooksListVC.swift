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

        let contentView = BookListView()
        let contentVC = UIHostingController(rootView: contentView)
        self.add(contentVC)
    }
    

 

}

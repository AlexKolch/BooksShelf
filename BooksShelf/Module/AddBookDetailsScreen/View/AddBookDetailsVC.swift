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

final class AddBookDetailsVC: UIViewController, AddBookDetailsVCProtocol {
    typealias PresenterType = AddBookDetailsPresenterProtocol
    var presenter: (any PresenterType)?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let contentView = AddBookDetailsView()
        let contentVC = UIHostingController(rootView: contentView)
        self.add(contentVC)
        
    }
    

   

}

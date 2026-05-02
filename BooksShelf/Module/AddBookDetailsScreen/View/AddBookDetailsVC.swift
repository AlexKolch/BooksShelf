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
        let viewContent = AddBookDetailsView()
        
        let content = UIHostingController(rootView: viewContent)
        addChild(content)
        view.addSubview(content.view)
        content.didMove(toParent: self)
    }
    

   

}

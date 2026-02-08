//
//  DetailsViewController.swift
//  BooksShelf
//
//  Created by Алексей Колыченков on 07.12.2025.
//

import UIKit
import SwiftUI

protocol DetailsViewProtocol: AnyObject, BaseViewProtocol {
    
}

final class DetailsVC: UIViewController, DetailsViewProtocol {
    typealias PresenterType = DetailsPresenterProtocol
    var presenter: PresenterType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let contentView = DetailsView()
        let contentVC = UIHostingController(rootView: contentView)
        self.add(contentVC)
    }
    


}

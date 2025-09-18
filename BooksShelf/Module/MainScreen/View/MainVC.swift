//
//  MainVC.swift
//  BooksShelf
//
//  Created by Алексей Колыченков on 18.09.2025.
//

import UIKit

protocol MainViewProtocol: BaseViewProtocol {
}

class MainVC: UIViewController, MainViewProtocol {
    typealias PresenterType = MainViewPresenterProtocol
    var presenter: (any PresenterType)?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .appOrange
        // Do any additional setup after loading the view.
    }

}

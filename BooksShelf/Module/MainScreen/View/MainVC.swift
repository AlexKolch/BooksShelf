//
//  MainVC.swift
//  BooksShelf
//
//  Created by Алексей Колыченков on 18.09.2025.
//

import UIKit
import SwiftUI

protocol MainViewProtocol: BaseViewProtocol {
}

class MainVC: UIViewController, MainViewProtocol {
    typealias PresenterType = MainViewPresenterProtocol
    var presenter: PresenterType?
    private var contentView: UIHostingController<MainView>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView = configureContentView()
    }
    
}

private extension MainVC {
    
    func configureContentView() -> UIHostingController<MainView> {
        let contentView = MainView(name: presenter?.name ?? "")
        let contentController = UIHostingController<MainView>(rootView: contentView)
        self.add(contentController)
        return contentController
    }

}

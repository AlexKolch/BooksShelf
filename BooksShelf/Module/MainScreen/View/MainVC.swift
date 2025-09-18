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
    var presenter: (any MainViewPresenterProtocol)?
    private var contentView: UIHostingController<MainView>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView = configureContentView()
        setConstraints()
    }
    
}

private extension MainVC {
    
    func configureContentView() -> UIHostingController<MainView> {
        let contentView = MainView(name: presenter?.name ?? "")
        let contentController = UIHostingController<MainView>(rootView: contentView)
        addChild(contentController)
        view.addSubview(contentController.view)
        contentController.didMove(toParent: self)
        return contentController
    }
    
    func setConstraints() {
        contentView.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.view.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
           ])
    }
}

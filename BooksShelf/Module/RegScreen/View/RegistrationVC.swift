//
//  RegistrationVC.swift
//  BooksShelf
//
//  Created by Алексей Колыченков on 13.09.2025.
//

import UIKit
import SwiftUI

protocol RegistVCProtocol: BaseViewProtocol {
    
}

final class RegistrationVC: UIViewController, RegistVCProtocol {
    typealias PresenterType = RegistPresenterProtocol
    var presenter: PresenterType?
    private var contentView: UIHostingController<RegistrationView>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView = configureContentView()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        contentView.view.frame = view.bounds
    }
    
    private func configureContentView() -> UIHostingController<RegistrationView> {
        let contentView = RegistrationView(btnAction: {print($0)})
        let content = UIHostingController(rootView: contentView)
        addChild(content)
        view.addSubview(content.view)
        content.didMove(toParent: self)
        return content
    }
}

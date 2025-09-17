//
//  OnboardingVC.swift
//  BooksShelf
//
//  Created by Алексей Колыченков on 16.09.2025.
//

import UIKit
import SwiftUI

protocol OnboardingViewProtocol: BaseViewProtocol {
   
}

class OnboardingVC: UIViewController, OnboardingViewProtocol {
    typealias PresenterType = OnboardingPresenterProtocol
    var presenter: (any OnboardingPresenterProtocol)?
    private var contentView: UIHostingController<OnboardingView>!

    override func viewDidLoad() {
        super.viewDidLoad()
        contentView = configureContentView()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        contentView.view.frame = view.bounds
    }
    
    private func configureContentView() -> UIHostingController<OnboardingView> {
        let contentView = OnboardingView(data: presenter?.mockData ?? []) {
            self.presenter?.startApp()
        }
        
        let content = UIHostingController(rootView: contentView)
        addChild(content)
        view.addSubview(content.view)
        content.didMove(toParent: self)
        return content
    }

}

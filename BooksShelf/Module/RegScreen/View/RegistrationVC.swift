//
//  RegistrationVC.swift
//  BooksShelf
//
//  Created by Алексей Колыченков on 13.09.2025.
//

import UIKit
import SwiftUI

protocol RegistViewProtocol: BaseViewProtocol {}

final class RegistrationVC: UIViewController, RegistViewProtocol {
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
        let contentView = RegistrationView { [weak self] name in
            do {
               try self?.presenter?.checkName(name)
            } catch let error as RegistrationPresenter.RegistrationError {
                let alert = UIAlertController(title: "Ошибка", message: error.rawValue, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self?.present(alert, animated: true)
            }
            catch {
                print("неизвестная ошибка")
            }
        }
        
        let content = UIHostingController(rootView: contentView)
        addChild(content)
        view.addSubview(content.view)
        content.didMove(toParent: self)
        return content
    }
}

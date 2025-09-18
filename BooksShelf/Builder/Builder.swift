//
//  Builder.swift
//  BooksShelf
//
//  Created by Алексей Колыченков on 13.09.2025.
//

import UIKit

protocol BaseViewProtocol: AnyObject {
    associatedtype PresenterType
    var presenter: PresenterType? { get set }
}

final class Builder {
    static private func create<T: UIViewController & BaseViewProtocol>(viewType: T.Type, presenter: (T) -> T.PresenterType) -> UIViewController {
        let view = viewType.init() // создаем экземпляр из переданного типа Вью
        let presenter = presenter(view)
        view.presenter = presenter
        return view
    }
    
    static func createRegistrationVC() -> UIViewController {
        create(viewType: RegistrationVC.self) { view in
            RegistrationPresenter(view: view)
        }
    }
    
    static func createOnboardingVC() -> UIViewController {
        create(viewType: OnboardingVC.self) { OnboardingPresenter(view: $0) }
    }
    
    static func createMainVC() -> UIViewController {
        create(viewType: MainVC.self) { MainPresenter(view: $0) }
    }
}

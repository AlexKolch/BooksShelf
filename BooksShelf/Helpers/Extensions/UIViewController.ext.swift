//
//  UIViewController.ext.swift
//  BooksShelf
//
//  Created by Алексей Колыченков on 23.01.2026.
//

import UIKit

extension UIViewController {
    ///Add child ViewController
    func add(_ child: UIViewController) {
        addChild(child)
        child.view.frame = self.view.frame
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }
}

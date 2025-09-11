//
//  ViewController.swift
//  BooksShelf
//
//  Created by Алексей Колыченков on 11.09.2025.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for family in UIFont.familyNames.sorted() {
           let names = UIFont.fontNames(forFamilyName: family)
           print("Family: \(family)\n Font names: \(names)")
        }
    }


}



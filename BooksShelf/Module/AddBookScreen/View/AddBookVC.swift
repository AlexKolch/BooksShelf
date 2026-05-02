//
//  AddBookVC.swift
//  BooksShelf
//
//  Created by Алексей Колыченков on 08.02.2026.
//

import UIKit
import SwiftUI

protocol AddBookViewProtocol: BaseViewProtocol {
    
}

final class AddBookVC: UIViewController, AddBookViewProtocol {
    typealias PresenterType = AddBookPresenterProtocol
    
    var presenter: (any PresenterType)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let contentView = AddBookView()
        let contentVC = UIHostingController(rootView: contentView)
        self.add(contentVC)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

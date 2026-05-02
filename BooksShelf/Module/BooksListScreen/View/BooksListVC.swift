//
//  BooksListVC.swift
//  BooksShelf
//
//  Created by Алексей Колыченков on 01.05.2026.
//

import UIKit

protocol BooksListViewProtocol: BaseViewProtocol {
    
}

final class BooksListVC: UIViewController, BooksListViewProtocol {
    typealias PresenterType = BooksListPresenterProtocol
    
    var presenter: (any PresenterType)?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

//
//  ViewController.swift
//  BooksShelf
//
//  Created by Алексей Колыченков on 11.09.2025.
//

import UIKit
import Lottie

class PreviewView: UIViewController {
    
    private let lottieView: LottieAnimationView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.loopMode = .loop
        $0.play()
        return $0
    }(LottieAnimationView(name: "Book with bookmark"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            NotificationCenter.default.post(name: .stateDidChange,
                                            object: nil,
                                            userInfo: [String.notifyInfo : AppState.registration])
        }
    }
    
    private func setupView() {
        view.backgroundColor = .bgMain
        view.addSubview(lottieView)
        
        NSLayoutConstraint.activate([
               lottieView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
               lottieView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
               lottieView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -80),
               lottieView.heightAnchor.constraint(equalTo: lottieView.widthAnchor)
           ])
    }
}



//
//  ViewController.swift
//  BooksShelf
//
//  Created by Алексей Колыченков on 11.09.2025.
//

import UIKit
import Lottie

class PreviewView: UIViewController {
    
    private let lottieView: LottieAnimationView = LottieAnimationView(name: "Book with bookmark")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        view.backgroundColor = .bgMain
        
        lottieView.translatesAutoresizingMaskIntoConstraints = false
        lottieView.play(fromFrame: 0, toFrame: 115, loopMode: .playOnce) { completed in
            NotificationCenter.default.post(name: .stateDidChange,
                                            object: nil,
                                            userInfo: [String.notifyInfo : AppState.registration])
        }
        view.addSubview(lottieView)
        
        NSLayoutConstraint.activate([
               lottieView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
               lottieView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
               lottieView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -80),
               lottieView.heightAnchor.constraint(equalTo: lottieView.widthAnchor)
           ])
    }
}



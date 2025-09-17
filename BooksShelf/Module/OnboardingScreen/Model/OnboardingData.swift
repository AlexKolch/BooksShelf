//
//  OnboardingData.swift
//  BooksShelf
//
//  Created by Алексей Колыченков on 16.09.2025.
//

import Foundation

struct OnboardingData {
    let image: String
    let description: String
    
    static let mockData: [OnboardingData] = [
        .init(image: "onboarding1", description: "Просмотр книг вашего личного кабинета"),
        .init(image: "onboarding2", description: "Добавление книг в личный кабинет"),
        .init(image: "onboarding3", description: "Поиск книг по автору или названию"),
        
    ]
}

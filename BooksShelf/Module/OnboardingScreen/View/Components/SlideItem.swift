//
//  SlideItem.swift
//  BooksShelf
//
//  Created by Алексей Колыченков on 17.09.2025.
//

import SwiftUI

struct SlideItem: View {
    let tag: Int
    let item: OnboardingData
    
    var body: some View {
        VStack(spacing: 10.0) {
            Image(item.image)
                .resizable()
                .frame(width: UIScreen.main.bounds.width - 86, height: UIScreen.main.bounds.width - 86)
            Text(item.description)
                .foregroundStyle(.white)
                .setFont(size: 16)
        }
        .tag(tag)
    }
}

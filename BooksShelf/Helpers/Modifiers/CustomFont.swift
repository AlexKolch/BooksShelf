//
//  CustomFont.swift
//  BooksShelf
//
//  Created by Алексей Колыченков on 16.09.2025.
//

import SwiftUI

struct CustomFont: ViewModifier {
    var font: FontManager
    var size: CGFloat 
    
    func body(content: Content) -> some View {
        content
            .font(.custom(font.rawValue, size: size))
    }
}

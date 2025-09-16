//
//  View.ext.swift
//  BooksShelf
//
//  Created by Алексей Колыченков on 16.09.2025.
//

import SwiftUI

extension View {
    func setFont(type: FontManager = .regular, size: CGFloat = 14) -> some View {
        modifier(CustomFont(font: type, size: size))
    }
}

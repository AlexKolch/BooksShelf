//
//  BookStatusBtn.swift
//  BooksShelf
//
//  Created by Алексей Колыченков on 22.01.2026.
//

import SwiftUI

struct BookStatusBtn: View {
    let status: BookStatus
    let action: () -> Void
    
    private var btnText: String {
        switch status {
        case .inProcess:
            return "In Process"
        case .done:
            return "Done"
        case .inFuture:
            return "Going read"
        }
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(btnText)
                .padding(.vertical, 3)
                .padding(.horizontal, 18)
                .setFont(type: .bold, size: 14)
                .foregroundStyle(.white)
                .background(getColor())
                .clipShape(Capsule())
        }
    }
    
    private func getColor() -> Color {
        switch status {
        case .inProcess:
            return .readingNow
        case .done:
            return .read
        case .inFuture:
            return .willRead
        }
    }
}

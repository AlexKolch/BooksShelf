//
//  AppToolbar.swift
//  BooksShelf
//
//  Created by Алексей Колыченков on 01.05.2026.
//
import SwiftUI

struct AppToolbar: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        HStack {
            Button {
                action()
            } label: {
                Image(systemName: "arrow.left")
                    .foregroundStyle(.white)
                    .font(.title)
            }
            Spacer()
            Text(title)
                .setFont(type: .black, size: 22)
                .foregroundStyle(.white)
            Spacer()
            Rectangle()
                .opacity(0)
                .frame(width: 20, height: 20)
        }
    }
}

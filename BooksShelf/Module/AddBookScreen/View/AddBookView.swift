//
//  AddBookView.swift
//  BooksShelf
//
//  Created by Алексей Колыченков on 01.05.2026.
//

import SwiftUI

struct AddBookView: View {
    var body: some View {
        VStack {
            HStack {
                Button {
                    
                } label: {
                    Image(systemName: "arrow.left")
                        .foregroundStyle(.white)
                        .font(.title)
                }
                Spacer()
                Text("About book")
                    .setFont(type: .semiBold, size: 20)
                    .foregroundStyle(.white)
                Spacer()
                Rectangle()
                    .opacity(0)
                    .frame(width: 20, height: 20)
            }
        }
        .background(Color.bgMain)
    }
}

#Preview {
    AddBookView()
}

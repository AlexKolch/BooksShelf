//
//  AddBookView.swift
//  BooksShelf
//
//  Created by Алексей Колыченков on 01.05.2026.
//

import SwiftUI

struct AddBookView: View {
    @State private var bookName = ""
    
    var body: some View {
        VStack {
            AppToolbar(title: "Add Book") {
                //to do
            }
            Spacer()
            BaseTF(placeholder: "title book", textField: $bookName)
            Spacer()
            OrangeButton(title: "Next") {
                //to do
            }
        }
        .padding(.horizontal, 20)
        .background(.bgMain)
    }
}

#Preview {
    AddBookView()
}




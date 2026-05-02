//
//  AddBookView.swift
//  BooksShelf
//
//  Created by Алексей Колыченков on 01.05.2026.
//

import SwiftUI

struct AddBookView: View {
    enum Route {
        case forward(String)
        case back
    }
    @State private var bookName = ""
    var routeHandler: ((Route) -> Void)
    
    var body: some View {
        VStack {
            AppToolbar(title: "Add Book") {
               routeHandler(.back)
            }
            Spacer()
            BaseTF(placeholder: "title book", textField: $bookName)
            Spacer()
            OrangeButton(title: "Next") {
                routeHandler(.forward(bookName))
            }
        }
        .padding(.horizontal, 20)
        .background(.bgMain)
    }
}





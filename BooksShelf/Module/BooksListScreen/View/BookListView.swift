//
//  File.swift
//  BooksShelf
//
//  Created by Алексей Колыченков on 01.05.2026.
//
import SwiftUI

struct BookListView: View {
    let booksList: [DtoBook]
    
    var body: some View {
        ZStack(alignment: .top) {
            AppToolbar(title: "Author") {
                //
            }
            ScrollView {
                VStack(alignment: .leading, spacing: 30) {
                    Text("Results searching")
                        .foregroundStyle(.white)
                        .setFont(size: 18)
                        .padding(.horizontal, 21)
                    
                    VStack(spacing: 23) {
                        ForEach(booksList, id: \.self) { book in
                            BookCell {
                                
                            }
                        }
                       
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .padding(.top, 44)
        }
        .padding(.horizontal, 20)
        .background(.bgMain)
    }
}

//#Preview {
//    BookListView()
//}

struct BookCell: View {
   let book: DtoBook
   let tapHandler: () -> Void
    
    var body: some View {
        Button {
            tapHandler()
        } label: {
            HStack(alignment: .top, spacing: 16) {
                Image(.cover)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 130)
                
                VStack(alignment: .leading) {
                    Text("Book title")
                        .foregroundStyle(.white)
                        .setFont(type: .black, size: 16)
                    Text("Author name")
                        .foregroundStyle(.appGray)
                        .setFont(type: .medium, size: 14)
                }
                .padding(.top, 10)
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundStyle(.white)
                    .padding(.top, 10)
            }
        }
    }
}

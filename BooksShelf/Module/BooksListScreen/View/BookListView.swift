//
//  File.swift
//  BooksShelf
//
//  Created by Алексей Колыченков on 01.05.2026.
//
import SwiftUI
import SDWebImageSwiftUI

struct BookListView: View {
    let booksList: [DtoBook]
    var cellTapped: (DtoBook?) -> Void
    
    var body: some View {
        ZStack(alignment: .top) {
            AppToolbar(title: "Add book") {
                cellTapped(nil)
            }
            ScrollView {
                VStack(alignment: .leading, spacing: 30) {
                    Text("Results searching")
                        .foregroundStyle(.white)
                        .setFont(size: 18)
                        .padding(.horizontal, 21)
                    
                    VStack(spacing: 23) {
                        ForEach(booksList, id: \.self) { book in
                            BookCell(book: book) {
                                cellTapped(book)
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
                BookCover(coverId: book.coverI?.description)
                    .frame(width: 80, height: 120)
                VStack(alignment: .leading) {
                    Text(book.title)
                        .foregroundStyle(.white)
                        .setFont(type: .black, size: 16)
                    Text(book.authorName?.first ?? "n/a")
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


struct BookCover: View {
    
    var coverId: String?
    
    var body: some View {
         if let coverId, let url = URL(string: "https://covers.openlibrary.org/b/id/\(coverId)-M.jpg") {
            WebImage(url: url)
                 .resizable()
                 .scaledToFit()
//                 .frame(width: 100, height: 130)
         } else {
             Image(systemName: "book.closed")
                 .resizable()
                 .foregroundStyle(.white)
                 .scaledToFill()
//                 .frame(width: 70, height: 90)
         }
    }
}

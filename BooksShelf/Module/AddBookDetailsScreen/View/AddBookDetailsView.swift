//
//  AddBookDetailsView.swift
//  BooksShelf
//
//  Created by Алексей Колыченков on 01.05.2026.
//

import SwiftUI

struct AddBookDetailsView: View {
//    enum Route {
//        case addBook, back
//    }
    @State private var bookName: String = ""
    @State private var bookDescrption: String = ""
    @State private var isShowPlaceholder: Bool = true
//    var routeHandler: (Route) -> Void
    var book: DtoBook?
    weak var delegate: AddBookDetailsDelegate?
    
    init(book: DtoBook? = nil, delegate: AddBookDetailsDelegate? = nil) {
        self.book = book
        self._bookName = .init(initialValue: book?.title ?? "")
        self.delegate = delegate
//        self.routeHandler = routeHandler
    }
    
    var body: some View {
        VStack {
            AppToolbar(title: book?.title ?? "") {
//                routeHandler(.back)
                delegate?.back()
            }
            VStack(spacing: 80) {
                BookCover(coverId: book?.coverI?.description)
                    .frame(width: 130, height: 180)
                    .overlay(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                        Button {
                           // delegate?.createBook()
                        } label: {
                            ZStack {
                                Circle()
                                    .foregroundStyle(.green)
                                    .frame(width: 24, height: 24)
                                Image(systemName: "arrowshape.turn.up.backward.circle.fill")
                                    .resizable()
                                    .frame(width: 12, height: 12)
                                    .foregroundStyle(.white)
                            }
                        }
                        .offset(x: 6, y: -6)
                    }
                
            
                VStack(spacing: 30) {
                    BaseTF(placeholder: "Title", textField: $bookName)
                    ZStack(alignment: .topLeading) {
                        TextEditor(text: $bookDescrption)
                            .scrollContentBackground(.hidden)
                            .frame(height: 114)
                            .padding(.horizontal, 15)
                            .padding(.vertical, 12)
                            .foregroundStyle(.white)
                            .background(.tFbg)
                            .clipShape(.rect(cornerRadius: 10))
                            .overlay(alignment: .topTrailing, content: {
                                Button {
                                    delegate?.createDescrBook(title: bookName) { desrp in
                                        DispatchQueue.main.async {
                                            self.bookDescrption = desrp
                                        }
                                    }
                                } label: {
                                    Image(.AI)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 24, height: 24)
                                        .foregroundStyle(.white)
                                        .padding(.trailing, 16)
                                        .padding(.top, 16)
                                        .clipped()
                                }
                            })
                            .onChange(of: bookDescrption) { _, newValue in
                                if !newValue.isEmpty {
                                   isShowPlaceholder = false
                                } else {
                                    isShowPlaceholder = true
                                }
                            }
                        if isShowPlaceholder {
                            Text("Descrption")
                                .setFont(size: 18)
                                .foregroundStyle(.appGray)
                                .offset(x: 18, y: 16)
                        }
                    }
                }
            }
            Spacer()
            OrangeButton(title: "Add") {
//                routeHandler(.addBook)
                delegate?.saveBook()
            }
        }
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: Alignment(horizontal: .leading, vertical: .top))
        .background(.bgMain)
     
    }
}

#Preview {
    AddBookDetailsView()
}

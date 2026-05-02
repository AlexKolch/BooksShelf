//
//  AddBookDetailsView.swift
//  BooksShelf
//
//  Created by Алексей Колыченков on 01.05.2026.
//

import SwiftUI

struct AddBookDetailsView: View {
    @State private var bookName: String = ""
    @State private var textDescrption: String = ""
    @State private var isShowPlaceholder: Bool = true
    
    var body: some View {
        VStack {
            AppToolbar(title: "Title") {
                //
            }
            VStack(spacing:80) {
                Image(.cover)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 190)
                    .clipShape(.rect(cornerRadius: 5))
                    .overlay(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                        Button {
                            //
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
                        .offset(x: 12, y: -12)
                    }
                
            
                VStack(spacing: 30) {
                    BaseTF(placeholder: "Title", textField: $bookName)
                    ZStack(alignment: .topLeading) {
                        TextEditor(text: $textDescrption)
                            .scrollContentBackground(.hidden)
                            .frame(height: 114)
                            .padding(.horizontal, 15)
                            .padding(.vertical, 12)
                            .foregroundStyle(.white)
                            .background(.tFbg)
                            .clipShape(.rect(cornerRadius: 10))
                            .overlay(alignment: .topTrailing, content: {
                                Button {
                                    //
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
                            .onChange(of: textDescrption) { _, newValue in
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
                //
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

//
//  MainView.swift
//  BooksShelf
//
//  Created by Алексей Колыченков on 18.09.2025.
//

import SwiftUI

struct MainView: View {
    enum SelectedCategory {
        case willRead
        case read
    }
    
    let name: String
    @State private var searchFieldText: String = ""
    @State private var selectedCategory: SelectedCategory = .willRead
    
    var body: some View {
        VStack(spacing: 0.0) {
            //MARK: - Header
            VStack(spacing: 25.0) {
                HStack(alignment: .firstTextBaseline) {
                    VStack(alignment: .leading){
                        Text("Привет")
                            .setFont()
                        Text(name)
                            .setFont(type: .black, size: 16)
                    }
                    Spacer()
                    Button {
                        //
                    } label: {
                        HStack(spacing: 10.0) {
                            Image(systemName: "book.closed.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 14)
                            Text("добавить")
                                .setFont()
                        }
                        .padding(.vertical, 9)
                        .padding(.horizontal, 21)
                        .background(.appOrange)
                        .clipShape(Capsule())
                    }
                }
                .foregroundStyle(.white)
            }
            .padding(.horizontal, 30)
            .background(Color.bgMain)
          
            ScrollView(.vertical, showsIndicators: false) {
                //MARK: - Searching & Reading Section
                VStack {
                    BaseTF(placeholder: "Поиск", textField: $searchFieldText)
                        .setFont(size: 16)
                        .padding(.horizontal, 30)
                    VStack(alignment: .leading, spacing: 18) {
                        Text("Читаю")
                            .setFont(type: .bold, size: 22)
                            .foregroundStyle(.white)
                            .padding(.horizontal, 30)
                        ScrollView(.horizontal, showsIndicators: false) {
                            mockBooks
                                .padding(.horizontal, 30)
                            
                        }
                    }
                }
                //MARK: - Will/DidRead Section
                VStack(alignment: .leading) {
                    HStack(alignment: .bottom, spacing: 26.0) {
                        Button {
                            selectedCategory = .willRead
                        } label: {
                            createButtenText(title: "Прочитать", category: .willRead)
                        }

                        Button {
                            selectedCategory = .read
                        } label: {
                            createButtenText(title: "Прочитал", category: .read)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    //MockData
                    if selectedCategory == .willRead {
                        VStack(spacing: 20.0) {
                            BookView()
                            BookView()
                        }
                    } else {
                        VStack(spacing: 20.0) {
                            BookView()
                            BookView()
                            BookView()
                            BookView()
                        }
                    }
                }.padding(.horizontal, 30)
            }
            .padding(.top, 20)
            .background(Color.bgMain)
        }
    }
    
    @ViewBuilder
    private func createButtenText(title: String, category: SelectedCategory) -> some View {
        let conditions = selectedCategory == category
        Text(title)
            .setFont(type: conditions ? .bold : .regular, size: conditions ? 22 : 18)
            .foregroundStyle(conditions ? .white : .appGray)
    }
}

#Preview {
    MainView(name: "Алексей")
}


private extension MainView {
    var mockBooks: some View {
        HStack(spacing: 16.0) {
            Button {
                //
            } label: {
                Image(.cover)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 143)
                    .clipShape(.rect(cornerRadius: 5))
            }
            Button {
                //
            } label: {
                Image(.cover)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 143)
                    .clipShape(.rect(cornerRadius: 5))
            }
            Button {
                //
            } label: {
                Image(.cover)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 143)
                    .clipShape(.rect(cornerRadius: 5))
            }
            Button {
                //
            } label: {
                Image(.cover)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 143)
                    .clipShape(.rect(cornerRadius: 5))
            }
        }
    }
}

//
//  DetailsView.swift
//  BooksShelf
//
//  Created by Алексей Колыченков on 12.12.2025.
//

import SwiftUI

struct DetailsView: View {
    @State private var bookNote: String = ""
    
    var body: some View {
        ZStack(alignment: .top) {
            // MARK: - Toolbar
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
                Button {
                    
                } label: {
                    Image(systemName: "ellipsis")
                        .rotationEffect(.degrees(90))
                        .foregroundStyle(.white)
                        .font(.title)
                }
            }
            .zIndex(1)
            .padding(.top, 55)
            .padding(.horizontal, 30)
            
            ScrollView {
                VStack(spacing: 29) {
                    // MARK: - Header book
                    ZStack() {
                        //Background
                        GeometryReader { proxy in
                            let minY = proxy.frame(in: .global).minY
                                Image(.cover)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(maxWidth: proxy.size.width) //лучше ограничить так, шириной экрана
                                    .frame(height: 410 + (minY > 0 ? minY : 0))
                                    .clipped()
                                    .overlay(content: {
                                        Color.black.opacity(0.5).blendMode(.darken)
                                    })
                                    .offset(y: -minY) //чтобы прибить к верху
                                    .clipped()
                        }
                        .frame(height: 400)
                        
                        //Foreground
                        VStack(spacing: 15.0) {
                            Image(.cover)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200, height: 200)
                            VStack(spacing: 2.0) {
                                Text("Title").setFont(type: .bold, size: 20)
                                Text("Author").setFont(type: .medium, size: 14)
                            }
                            .foregroundStyle(.white)
                            
                            BookStatusBtn(status: .done) {
                                //to do
                            }
                        }
                        .padding(.top, 85)
                    }
                // MARK: - Description section
                    VStack(alignment: .leading, spacing: 36) {
                        // MARK: #1 Description
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Description")
                                .setFont(type: .black, size: 18)
                                .foregroundStyle(.white)
                            Text("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo")
                                .setFont(size: 14)
                                .foregroundStyle(.appGray)
                        }
                        // MARK: #2 Notes
                        VStack(alignment: .leading, spacing: 14) {
                            Text("Book's notes")
                                .setFont(type: .bold, size: 18)
                                .foregroundStyle(.white)
                            
                            VStack(alignment: .leading, spacing: 14) {
                               NoteView()
                                NoteView()
                         
                            }
                            BaseTF(placeholder: "Add note", textField: $bookNote)
                        }
                    }
                    .padding(.horizontal, 30)
                }
                .padding(.bottom, 30)
            }
        }
        .ignoresSafeArea()
        .background(.bgMain)
    }
}

#Preview {
    DetailsView()
}




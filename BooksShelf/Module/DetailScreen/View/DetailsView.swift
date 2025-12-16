//
//  DetailsView.swift
//  BooksShelf
//
//  Created by Алексей Колыченков on 12.12.2025.
//

import SwiftUI

struct DetailsView: View {
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
                VStack {
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
                    
                    // MARK: - Description book
                    VStack {
                        
                    }
                }
            }
        }
        .ignoresSafeArea()
        .background(.bgMain)
    }
}

#Preview {
    DetailsView()
}

struct BookStatusBtn: View {
    let status: BookStatus
    let action: () -> Void
    
    private var btnText: String {
        switch status {
        case .inProcess:
            return "In Process"
        case .done:
            return "Done"
        case .inFuture:
            return "Going read"
        }
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(btnText)
                .padding(.vertical, 3)
                .padding(.horizontal, 18)
                .setFont(type: .bold, size: 14)
                .foregroundStyle(.white)
                .background(getColor())
                .clipShape(Capsule())
        }
    }
    
    private func getColor() -> Color {
        switch status {
        case .inProcess:
            return .readingNow
        case .done:
            return .read
        case .inFuture:
            return .willRead
        }
    }
}

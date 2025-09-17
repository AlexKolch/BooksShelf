//
//  OnboardingView.swift
//  BooksShelf
//
//  Created by Алексей Колыченков on 16.09.2025.
//

import SwiftUI

struct OnboardingView: View {
    @State private var selectedIndex = 0
    @State private var textBtn = "Далее"
    let data: [OnboardingData]
    let completionBtn: () -> Void
    
    var body: some View {
        VStack {
            Text("Добро пожаловать")
                .setFont(type: .black, size: 22)
                .foregroundStyle(.white)
            Spacer()
            VStack {
                TabView(selection: $selectedIndex) {
                    ForEach(0..<data.count, id: \.self) { slideIndex in
                        SlideItem(tag: slideIndex, item: data[slideIndex])
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                
                HStack(spacing: 8.0) {
                    ForEach(0..<data.count, id: \.self) { slideIndex in
                        Circle()
                            .frame(width: 8, height: 8)
                            .foregroundStyle(selectedIndex == slideIndex ? .appOrange : .gray)
                            .onTapGesture {
                                print("onTapGesture")
                                withAnimation {
                                    selectedIndex = slideIndex
                                }
                            }
                    }
                }.onChange(of: selectedIndex) { _, _ in
                    withAnimation {
                        textBtn = selectedIndex == data.count - 1 ? "Начать пользоваться" : "Далее"
                    }
                }
            }
            .frame(maxHeight: 400)
            Spacer()
            
            OrangeButton(title: textBtn, isActive: true) {
                if selectedIndex < data.count - 1 {
                    withAnimation {
                        selectedIndex += 1
                    }
                } else {
                    completionBtn()
                }
            }
            .padding(.horizontal, 30)
        }
        .background(.bgMain)
    }
}

#Preview {
    OnboardingView(data: OnboardingData.mockData, completionBtn: {print("completed")})
}

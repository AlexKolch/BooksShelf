//
//  RegistrationView.swift
//  BooksShelf
//
//  Created by Алексей Колыченков on 14.09.2025.
//

import SwiftUI

struct RegistrationView: View {
    @State private var nameField = ""
    
    private var isActiveBtn: Bool { nameField.isEmpty ? false : true }
    var btnAction: ((String) -> Void) //запишем сюда данные из TF для передачи в RegistrationVC
    
    var body: some View {
        ZStack {
            VStack {
                Text("Добро пожаловать")
                    .setFont(type: .black, size: 22)
                    .foregroundStyle(.white)
                Spacer()
                TextField("Ваше имя", text: $nameField)
                    .frame(maxWidth: .infinity)
                    .frame(height: 52)
                    .padding(.horizontal, 10)
                    .foregroundStyle(.white)
                    .background(.tFbg)
                    .clipShape(.rect(cornerRadius: 10))
                Spacer()
                OrangeButton(title: "Далее", isActive: isActiveBtn) {
                    if isActiveBtn {
                        btnAction(nameField)
                    }
                }
            }
            .padding(.horizontal, 30)
        }
        .background(.bgMain)
    }
}

struct OrangeButton: View {
    let title: String
    var isActive: Bool
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .padding(.vertical, 19)
                .frame(maxWidth: .infinity)
                .foregroundStyle(.white)
                .background(isActive ? .appOrange : Color.gray)
                .clipShape(.buttonBorder)
                .setFont(type: .bold, size: 14)
        }
        .disabled(!isActive)
    }
}

#Preview {
    RegistrationView(btnAction: {print($0)})
}

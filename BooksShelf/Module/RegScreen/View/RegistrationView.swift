//
//  RegistrationView.swift
//  BooksShelf
//
//  Created by Алексей Колыченков on 14.09.2025.
//

import SwiftUI

struct RegistrationView: View {
    @State private var nameField = ""
    
    private var isActiveBtn: Bool { nameField.isEmpty ? true : false }
    var btnAction: ((String) -> Void) //передадим сюда данные из TF в RegistrationVC
    
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
                    Button {
                        btnAction(nameField)
                    } label: {
                        Text("Далее")
                            .padding(.vertical, 19)
                            .frame(maxWidth: .infinity)
                            .foregroundStyle(.white)
                            .background(isActiveBtn ? Color.gray : .appOrange)
                            .clipShape(.buttonBorder)
                            .setFont(type: .bold, size: 14)
                            .disabled(isActiveBtn)
                    }                
            }
            .padding(.horizontal, 30)
        }
        .background(.bgMain)
       
    }
}

#Preview {
    RegistrationView(btnAction: {print($0)})
}

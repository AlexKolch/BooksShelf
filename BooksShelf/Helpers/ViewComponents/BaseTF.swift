//
//  BaseTF.swift
//  BooksShelf
//
//  Created by Алексей Колыченков on 18.09.2025.
//

import SwiftUI

struct BaseTF: View {
    let placeholder: String
    @Binding var textField: String
    
    var body: some View {
        TextField(placeholder, text: $textField)
            .frame(maxWidth: .infinity)
            .frame(height: 52)
            .padding(.horizontal, 10)
            .foregroundStyle(.white)
            .background(.tFbg)
            .clipShape(.rect(cornerRadius: 10))
    }
}


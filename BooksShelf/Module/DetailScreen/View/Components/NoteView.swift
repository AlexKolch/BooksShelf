//
//  NoteView.swift
//  BooksShelf
//
//  Created by Алексей Колыченков on 08.02.2026.
//

import SwiftUI

struct NoteView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("12.01.2026")
                .setFont(size: 12)
                .foregroundStyle(.white)
            Text("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo")
                .setFont(size: 13)
                .foregroundStyle(.appGray)
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 21)
        .background(.tFbg)
    }
}

#Preview {
    NoteView()
}

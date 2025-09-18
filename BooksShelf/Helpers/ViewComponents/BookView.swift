//
//  BookView.swift
//  BooksShelf
//
//  Created by Алексей Колыченков on 18.09.2025.
//

import SwiftUI

struct BookView: View {
   // var book: Book
    var body: some View {
        HStack(alignment: .top, spacing: 13) {
            Image(.cover1)
                .resizable()
                .frame(width: 64, height: 94)
                .clipShape(.rect(cornerRadius: 3))
            VStack(alignment: .leading, spacing: 9.0) {
                VStack(alignment: .leading, spacing: 2.0) {
                    Text("Преступление и наказание")
                        .setFont(type: .bold)
                    Text("Федор Достоевский")
                        .setFont(type: .medium, size: 12)
                        .foregroundStyle(.appGray)
                }
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam congue est vel ultrices suscipit. Praesent a dignissim augue. Nullam ac gravida tellus. In euismod id nunc sit amet luctus. Nulla ut odio in turpis convallis ullamcorper. Duis blandit venenatis venenatis. Nunc ligula odio, mattis eu nisi eget, aliquet consectetur augue. Aenean consectetur enim ex, ac malesuada nisl aliquet in. Nullam bibendum nisi eu gravida pellentesque. Suspendisse blandit mi eu dui pulvinar sollicitudin. Maecenas sed tincidunt nunc. Aenean efficitur dictum quam sed placerat. Ut eget rutrum nibh. Morbi egestas erat et quam varius accumsan in sed odio. Fusce pretium, urna non auctor volutpat, velit libero malesuada eros, eget fringilla dolor est et dui. Etiam hendrerit pharetra velit quis posuere.")
                    .frame(maxHeight: 64)
                    .setFont(type: .medium)
                    .lineLimit(2)
            }
            .foregroundStyle(.white)
        }
      
    }
}

#Preview {
    BookView()
        .background(Color.bgMain)
}

//
//  DtoBook.swift
//  BooksShelf
//
//  Created by Алексей Колыченков on 02.05.2026.
//

import Foundation

struct DtoBookResponse: Decodable {
    let docs: [DtoBook]
}

struct DtoBook: Decodable, Hashable {
    let authorName: [String]?
    let coverI: Int?
    let title: String
    
    
    enum CodingKeys: String, CodingKey {
        case authorName = "author_name"
        case coverI = "cover_i"
        case title
    }
}

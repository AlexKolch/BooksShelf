//
//  GigaRequest.swift
//  BooksShelf
//
//  Created by Алексей Колыченков on 31.05.2026.
//

import Foundation
// MARK: - Запросы к ИИ
struct GigaChatRequest: Encodable {
    let model: String = "GigaChat-2"
    let messages: [GigaChatMessage]
}

struct GigaChatMessage: Encodable {
    let role: String = "user"
    let content: String
}


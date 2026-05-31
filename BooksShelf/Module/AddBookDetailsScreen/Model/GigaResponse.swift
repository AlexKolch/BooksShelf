//
//  GigaResponse.swift
//  BooksShelf
//
//  Created by Алексей Колыченков on 31.05.2026.
//

import Foundation
// MARK: - Токен
struct GigaChatTokenResponse: Decodable {
    let accessToken: String
    let expiresAt: Int
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case expiresAt = "expires_at"
    }
}
// MARK: - Ответы ИИ
struct GigaChatResponse: Decodable {
    let choices: [Choice]
}

struct Choice: Decodable {
    let message: Message
}

struct Message: Decodable {
    let content: String
    let role: String
}

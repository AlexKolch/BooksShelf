//
//  BookRepository.swift
//  BooksShelf
//
//  Created by Алексей Колыченков on 02.05.2026.
//

import Foundation

enum NetworkError: Error {
    case noData
    case decodingError
    case someError
}

protocol NetworkService {
    func get(by: String, completion: @escaping (Result<[DtoBook], NetworkError>) -> Void)
}

final class BookRepository: NetworkService {
    
   private let baseUrl = "https://openlibrary.org/search.json"
    
    func get(by query: String, completion: @escaping (Result<[DtoBook], NetworkError>) -> Void) {
        var urlComponent = URLComponents(string: baseUrl)
        urlComponent?.queryItems = [
            URLQueryItem(name: "q", value: query),
            URLQueryItem(name: "fields", value: "author_name,cover_i,title"),
            URLQueryItem(name: "lang", value: "ru"),
        ]
        
        guard let url = urlComponent?.url else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if error != nil {
                completion(.failure(NetworkError.someError))
                return
            }
            guard let data else {
                completion(.failure(NetworkError.noData))
                return
            }
            
            do {
                let books = try self.decode<DtoBookResponse>(data: data) as DtoBookResponse
                completion(.success(books.docs))
            } catch {
                completion(.failure(NetworkError.decodingError))
            }
        }.resume()
    }
    
    func decode<T>(data: Data) throws -> T where T: Decodable {
        do {
          return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw error
        }
    }
}

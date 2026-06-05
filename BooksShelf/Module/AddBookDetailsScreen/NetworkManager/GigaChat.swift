//
//  GigaChat.swift
//  BooksShelf
//
//  Created by Алексей Колыченков on 31.05.2026.
//

import Foundation

final class GigaChat {
    static let shared = GigaChat()
    private var accessToken: String?
    private var tokenExpirationDate: Date?
    
    // Ключи для UserDefaults
    private let tokenKey = "gigaChatAccessToken"
    private let expirationKey = "gigaChatTokenExpiration"
    
    private init() {
        loadTokenFromStorage()
    }
    
    /// Загрузка сохраненного токена при инициализации
    private func loadTokenFromStorage() {
        accessToken = UserDefaults.standard.string(forKey: tokenKey)
        
        if let expirationTimeInterval = UserDefaults.standard.object(forKey: expirationKey) as? TimeInterval {
            tokenExpirationDate = Date(timeIntervalSince1970: expirationTimeInterval)
        }
    }
    
    /// Сохранение токена в UserDefaults
    // expiresAt - количество секунд до истечения токена
    private func saveTokenToStorage(accessToken: String, expiresAt: Int) {
        UserDefaults.standard.set(accessToken, forKey: tokenKey)
        
        // Сохраняем дату истечения как timestamp
        let expirationDate = Date().addingTimeInterval(TimeInterval(expiresAt))
        UserDefaults.standard.set(expirationDate.timeIntervalSince1970, forKey: expirationKey)
    }
    
    private func isValidToken() -> Bool {
        guard let token = accessToken,
              let expirationDate = tokenExpirationDate else {
            return false
        }
        
        // Добавляем небольшой запас в 5 минут, чтобы не использовать токен на грани истечения
        let bufferTime: TimeInterval = 300 // 5 минут
        return Date().addingTimeInterval(bufferTime) < expirationDate && !token.isEmpty
    }
    
    
    private func getAccessToken(_ completion: @escaping (Result<GigaChatTokenResponse, Error>) -> Void) {
        print("Запрашиваем новый токен")
        let urlString = "https://ngw.devices.sberbank.ru:9443/api/v2/oauth"
        let authKey = ""
        guard let url = URL(string: urlString) else { return }
        
        var req = URLRequest(url: url)
        req.httpMethod = "POST"
        req.allHTTPHeaderFields = [
            "Content-Type": "application/x-www-form-urlencoded",
            "Accept": "application/json",
            "RqUID": (UUID().uuidString),
            "Authorization": "Basic \(authKey)"
        ]
        let bodyString = "scope=GIGACHAT_API_PERS"
        req.httpBody = bodyString.data(using: .utf8)
        // Распечатайте то, что отправляете
        if let body = req.httpBody {
            print(String(data: body, encoding: .utf8) ?? "нет x-www-form-urlencoded")
        }
        
        URLSession.shared.dataTask(with: req) { [weak self] data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else { return }
            
            do {
                let tokenResponse = try JSONDecoder().decode(GigaChatTokenResponse.self, from: data)
                // Сохраняем новый токен
                guard let self = self else { return }
                self.accessToken = tokenResponse.accessToken
                // "expiresAt" в ответе предполагается в секундах; сохраняем дату истечения
                self.tokenExpirationDate = Date().addingTimeInterval(TimeInterval(tokenResponse.expiresAt))
                // Сохраняем исходные данные: сам токен и количество секунд до истечения
                self.saveTokenToStorage(accessToken: tokenResponse.accessToken, expiresAt: tokenResponse.expiresAt)
                completion(.success(tokenResponse))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    private func sendChatRequest(bookName: String, completion: @escaping (Result<String, Error>) -> Void) {
        let urlString = "https://gigachat.devices.sberbank.ru/api/v1/chat/completions"
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0)))
            return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = [
            "Content-Type": "application/json",
            "Accept": "application/json",
            "Authorization": "Bearer \(accessToken ?? "")"
        ]
        
        let reqBody = GigaChatRequest(messages: [
            GigaChatMessage(content: "Опиши книгу \(bookName) в 3-5 предложений")
        ])
        
        do {
            let encodedBody = try JSONEncoder().encode(reqBody)
            request.httpBody = encodedBody
        } catch {
            completion(.failure(NSError(domain: "Encoded Error", code: 0, userInfo: nil)))
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "Response No Data Error", code: 0, userInfo: nil)))
                return
            }
            
            // Проверка HTTP статуса
            if let httpResponse = response as? HTTPURLResponse,
               !(200...299).contains(httpResponse.statusCode) {
                let errorMsg = String(data: data, encoding: .utf8) ?? "Bad HTTP Response"
                completion(.failure(NSError(domain: "HTTP Error: \(httpResponse.statusCode)", code: httpResponse.statusCode, userInfo: [NSLocalizedDescriptionKey: errorMsg])))
                return
            }
            
            do {
                let responseData = try JSONDecoder().decode(GigaChatResponse.self, from: data)
                
                if let firstChoice = responseData.choices.first {
                    completion(.success(firstChoice.message.content))
                } else {
                    completion(.failure(NSError(domain: "No choices in response", code: 0)))
                }
            } catch {
                completion(.failure(NSError(domain: "Decode Error", code: 0, userInfo: nil)))
            }
        }.resume()
    }
    
    func sendRequest(bookName: String, completion: @escaping (Result<String, Error>) -> Void) {
        if isValidToken() {
            print("Запрос с валидным токеном")
            sendChatRequest(bookName: bookName, completion: completion)
        } else {
            getAccessToken { [weak self] res in
                switch res {
                case .success:
                    self?.sendChatRequest(bookName: bookName, completion: completion)
                case .failure(let err):
                    print(err.localizedDescription)
                }
            }
        }
    }
}


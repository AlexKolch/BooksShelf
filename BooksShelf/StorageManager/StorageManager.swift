//
//  StorageManager.swift
//  BooksShelf
//
//  Created by Алексей Колыченков on 17.09.2025.
//

import Foundation

final class StorageManager {
    // URL доступ к FileManager
    private let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    
    ///`saveCover` метод для сохранения обложки
    func saveCover(bookId: String, coverData: Data) {
        let bookPath = path.appending(component: bookId) // Создаем путь
        do {
            try FileManager.default.createDirectory(at: bookPath, withIntermediateDirectories: true) // создает папку
        } catch {
            print("Error creating directory in FileManager")
        }
        
        let coverPath = bookPath.appending(component: "cover.jpg") //добавляем название
        
        // Cохранение картинки по этому пути
        do {
            try coverData.write(to: coverPath)
        } catch {
            print("Error saving data to FileManager: \(error.localizedDescription)")
        }
    }
    
    ///`getCover` метод для получения обложки
    func getCover(bookId: String) -> Data? {
        let coverPath = path
            .appending(component: bookId) // зайдем в папку
            .appendingPathComponent("cover.jpg") // возьмем файл
        
        do {
            let coverData = try Data(contentsOf: coverPath)
            return coverData
        } catch {
            print("Error getting data from FileManager: \(error.localizedDescription)")
            return nil
        }
    }
    
//    func getCover(bookId: String) throws -> Data {
//        let coverPath = path
//            .appending(component: bookId) // зайдем в папку
//            .appendingPathComponent("cover.jpg") // возьмем файл
//        
//        do {
//            let coverData = try Data(contentsOf: coverPath)
//            return coverData
//        } catch {
//            throw error
//        }
//        
//    }
}

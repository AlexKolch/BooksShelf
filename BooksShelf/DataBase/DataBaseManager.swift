//
//  DataBaseManager.swift
//  BooksShelf
//
//  Created by Алексей Колыченков on 17.09.2025.
//

import Foundation
import CoreData

final class DataBaseManager {
    static let shared = DataBaseManager(); private init() {}
    
    var books: [Book] = []
    private let storageManager = StorageManager()
    
    //MARK: Container
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "db")
        container.loadPersistentStores { storeDescription, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    
    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let error = error as NSError
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }
}
//MARK: CRUD
extension DataBaseManager {
  /// `createBook` метод для сохранения одной книги
    func createBook(name: String, description: String, author: String, coverImage: Data) {
        // Создаем объект
        let bookId = UUID().uuidString
        let _: Book = {
            $0.id = bookId
            $0.name = name
            $0.bookDescrpt = description
            $0.author = author
            $0.date = Date()
            $0.imageURL = bookId + "cover.jpg"
            $0.status = BookStatus.inProcess.rawValue
            return $0
        }(Book(context: persistentContainer.viewContext))
        
        // Сохраняем в базе данных
        saveContext()
        storageManager.saveCover(bookId: bookId, coverData: coverImage)
    }
    
    /// `fetchBooks` метод для получения всех книг
    func fetchBooks() {
        let request: NSFetchRequest<Book> = Book.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "date", ascending: true)]
        
        do {
            books = try persistentContainer.viewContext.fetch(request)
        } catch {
            print("Fetching Error: \(error.localizedDescription)")
        }
    }
    
    //MARK: Note
    func addNote(book: Book, noteText: String) {
        let _: Note = {
            $0.id = UUID().uuidString
            $0.text = noteText
            $0.date = Date()
            $0.book = book
            return $0
        }(Note(context: persistentContainer.viewContext))
    }
    
    func deleteBook(book: Book) {
        persistentContainer.viewContext.delete(book)
        saveContext()
    }
}



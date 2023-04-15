//
//  CoreData.swift
//  
//
//  Created by Ale on 15/04/23.
//

import CoreData
import SwiftUI

class Persistence {
    static let shared = Persistence()

    static var isEmpty: Bool {
        do {
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Quote")
            let count  = try Persistence(inMemory: false).container.viewContext.count(for: request)
            return count == 0
        } catch {
            return true
        }
    }

    static let previewFull: Persistence = {
        let result = Persistence(inMemory: false)
        let context = result.container.viewContext
        
        
        if isEmpty {
            shared.saveQuotesFromJSON()
        }
        
        return result
    }()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        let quoteEntity = NSEntityDescription()
        quoteEntity.name = "Quote"
        quoteEntity.managedObjectClassName = "Quote"
        
        let nameAttribute = NSAttributeDescription()
        nameAttribute.name = "text"
        nameAttribute.type = .string
        quoteEntity.properties.append(nameAttribute)

        let authorAttribute = NSAttributeDescription()
        authorAttribute.name = "author"
        authorAttribute.type = .string
        quoteEntity.properties.append(authorAttribute)

        let favoriteAttribute = NSAttributeDescription()
        favoriteAttribute.name = "favorite"
        favoriteAttribute.type = .boolean
        quoteEntity.properties.append(favoriteAttribute)

        let indexAttribute = NSAttributeDescription()
        indexAttribute.name = "index"
        indexAttribute.type = .integer64
        quoteEntity.properties.append(indexAttribute)

        let model = NSManagedObjectModel()
        model.entities = [quoteEntity]

        let container = NSPersistentContainer(name: "QuoteModel", managedObjectModel: model)

        print(inMemory)
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }

        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("failed with: \(error.localizedDescription)")
            }
        }

        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy

        container.viewContext.automaticallyMergesChangesFromParent = true
        self.container = container
    }
    
    func toggleQuoteFavorite (quote: Quote) {
        do {
            quote.favorite.toggle()
            try container.viewContext.save()
        } catch {
            debugPrint(error)
        }
    }
    
    func saveQuotesFromJSON() {
        guard let url = Bundle.main.url(forResource: "stoicquotes", withExtension: "json") else {
            print("Could not find JSON file")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let json = try JSONSerialization.jsonObject(with: data, options: []) as! [[String:Any]]
            
            let context = container.viewContext
            
            for quoteData in json {
                let quote = Quote(context: context)
                quote.text = quoteData["text"] as! String
                quote.author = quoteData["author"] as? String
                quote.favorite = quoteData["favorite"] as! Bool
                quote.index = quoteData["index"] as! Int
            }
            
            try context.save()
            
        } catch let error {
            print("Error saving quotes: \(error.localizedDescription)")
        }
    }

}



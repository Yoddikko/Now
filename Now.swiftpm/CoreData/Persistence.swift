//
//  Persistence.swift
//  
//
//  Created by Ale on 15/04/23.
//

import CoreData
import SwiftUI

class Persistence: ObservableObject {
    
    var userDataEntries = [UserDataEntity]()
    
    @AppStorage("isFirstTime") private var isFirstTime = true
    
    static let shared = Persistence()
    
    static let previewFull: Persistence = {
        let result = Persistence(inMemory: false)
        let context = result.container.viewContext
        
        var isEmpty: Bool {
            do {
                let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Quote")
                let count  = try context.count(for: request)
                return count == 0
            } catch {
                return true
            }
        }
        
        if isEmpty {
            shared.saveQuotesFromJSON(context: context)
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
        


        let userDataEntity = NSEntityDescription()
        userDataEntity.name = "UserDataEntity"
        userDataEntity.managedObjectClassName = "UserDataEntity"

        let breathingAttribute = NSAttributeDescription()
        breathingAttribute.name = "breathing"
        breathingAttribute.type = .integer64
        userDataEntity.properties.append(breathingAttribute)

        let journalAttribute = NSAttributeDescription()
        journalAttribute.name = "journal"
        journalAttribute.type = .string
        userDataEntity.properties.append(journalAttribute)

        let quoteIndexAttribute = NSAttributeDescription()
        quoteIndexAttribute.name = "quoteIndex"
        quoteIndexAttribute.type = .integer64
        userDataEntity.properties.append(quoteIndexAttribute)

        let gratitude1Attribute = NSAttributeDescription()
        gratitude1Attribute.name = "gratitude1"
        gratitude1Attribute.type = .string
        userDataEntity.properties.append(gratitude1Attribute)

        let gratitude2Attribute = NSAttributeDescription()
        gratitude2Attribute.name = "gratitude2"
        gratitude2Attribute.type = .string
        userDataEntity.properties.append(gratitude2Attribute)

        let gratitude3Attribute = NSAttributeDescription()
        gratitude3Attribute.name = "gratitude3"
        gratitude3Attribute.type = .string
        userDataEntity.properties.append(gratitude3Attribute)
        
        let uuidAttribute = NSAttributeDescription()
        uuidAttribute.name = "uuid"
        uuidAttribute.type = .uuid
        userDataEntity.properties.append(uuidAttribute)
        
        let dateAttribute = NSAttributeDescription()
        dateAttribute.name = "date"
        dateAttribute.type = .string
        userDataEntity.properties.append(dateAttribute)



        let model = NSManagedObjectModel()
        model.entities = [quoteEntity, userDataEntity]
        
        let container = NSPersistentContainer(name: "Now", managedObjectModel: model)
        
        
        

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
    
    func toggleQuoteFavorite(index: Int, context: NSManagedObjectContext) {
        let fetchRequest: NSFetchRequest<Quote> = NSFetchRequest<Quote>(entityName: "Quote")
        fetchRequest.predicate = NSPredicate(format: "index == %@", index as NSNumber)
        
        do {
            let results = try container.viewContext.fetch(fetchRequest)
            if let quote = results.first {
                quote.favorite.toggle()
                try context.save()
            }
        } catch {
            debugPrint(error)
        }
    }
        
    func fetchUserDataEntities(context: NSManagedObjectContext) -> [UserDataEntity]? {
        let fetchRequest: NSFetchRequest<UserDataEntity> = NSFetchRequest<UserDataEntity>(entityName: "UserDataEntity")
        
        do {
            var results = try container.viewContext.fetch(fetchRequest)
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss Z" // formato della data come stringa
            results.sort(by: { (first, second) -> Bool in
                if let firstDate = dateFormatter.date(from: first.date), let secondDate = dateFormatter.date(from: second.date) {
                    
                    
                    return firstDate > secondDate // ordine decrescente, dal più recente
                } else {
                    return false // in caso di errori durante la conversione delle date, mantieni l'ordine attuale
                }
            })
            try container.viewContext.save()
            userDataEntries.append(contentsOf: results)
            return results
            
        
    } catch {
        debugPrint(error)
    }
        return []
}
    
    func saveQuotesFromJSON(context: NSManagedObjectContext) {
        if isFirstTime {
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
                isFirstTime = false
            } catch let error {
                print("Error saving quotes: \(error.localizedDescription)")
            }
        } else {
            return
        }
    }
    
    func castUserData(userDataEntity: UserDataEntity, context: NSManagedObjectContext) -> UserData {
        var gratitude : [String] = []
        if userDataEntity.gratitude1 != "" {
            gratitude.append(userDataEntity.gratitude1)
        }
        if userDataEntity.gratitude2 != "" {
            gratitude.append(userDataEntity.gratitude2)
        }
        if userDataEntity.gratitude3 != "" {
            gratitude.append(userDataEntity.gratitude3)
        }
        
        
        let quote = getQuoteFromIndex(index: userDataEntity.quoteIndex, context: context)
        
        let userData = UserData(breathing: userDataEntity.breathing, journal: userDataEntity.journal, quote: quote, gratitude: gratitude)
        return userData
    }
    
    func fetchQuotes(context: NSManagedObjectContext) -> [Quote]? {
        let fetchRequest: NSFetchRequest<Quote> = NSFetchRequest<Quote>(entityName: "Quote")
        var quotes = [Quote]()
        do {
            let results = try container.viewContext.fetch(fetchRequest)
            quotes.append(contentsOf: results)
        } catch {
            debugPrint(error)
        }
        return quotes
    }
    
    func getUserData (uuid: UUID, context: NSManagedObjectContext) -> UserData? {
        var castedUserData = UserData()
        let userDataEntity = userDataEntries.first(where: {
            $0.id == uuid
        })
        castedUserData = castUserData(userDataEntity: userDataEntity!, context: context)

        return castedUserData
        
    }
        
    func saveUserData(context: NSManagedObjectContext, userData: UserData) {
        let userDataEntity = UserDataEntity(context: context)
        userDataEntity.breathing = userData.breathing
        if userData.gratitude?.count == 1 {
            userDataEntity.gratitude1 = userData.gratitude?[0] ?? ""
        }
        if  userData.gratitude?.count == 2 {
            userDataEntity.gratitude1 = userData.gratitude?[0] ?? ""
            userDataEntity.gratitude2 = userData.gratitude?[1] ?? ""
        }
        if userData.gratitude?.count == 3 {
            userDataEntity.gratitude1 = userData.gratitude?[0] ?? ""
            userDataEntity.gratitude2 = userData.gratitude?[1] ?? ""
            userDataEntity.gratitude3 = userData.gratitude?[2] ?? ""
        }

        
        userDataEntity.journal = userData.journal
        userDataEntity.uuid = UUID()
        userDataEntity.quoteIndex = userData.quote?.index ?? -1
        userDataEntity.date = Date().description
        do {
            try context.save()
        } catch {
            debugPrint(error.localizedDescription)
        }
    }
    
    func getQuoteFromIndex(index: Int, context: NSManagedObjectContext) -> Quote? {
        let quotes = fetchQuotes(context: context)
        let quote = quotes?.first(where: { quote in
            quote.index == index
        })
        return quote
    }
}


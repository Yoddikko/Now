//
//  File.swift
//  
//
//  Created by Ale on 17/04/23.
//

import CoreData
import SwiftUI

@objc(UserDataEntity)
class UserDataEntity: NSManagedObject {
    @NSManaged var breathing: Int
    @NSManaged var journal: String
    @NSManaged var quoteIndex: Int
    @NSManaged var gratitude1: String
    @NSManaged var gratitude2: String
    @NSManaged var gratitude3: String
    @NSManaged var uuid : UUID
    @NSManaged var date: String

}

extension UserDataEntity: Identifiable {
    var id: UUID {
        uuid
    }
}


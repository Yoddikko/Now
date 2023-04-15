//
//  Quote.swift
//
//
//  Created by Ale on 15/04/23.
//

import CoreData
import SwiftUI

@objc(Quote)
class Quote: NSManagedObject {
    @NSManaged var text: String
    @NSManaged var author: String?
    @NSManaged var favorite: Bool
    @NSManaged var index: Int
}

extension Quote: Identifiable {
    var id: Int {
        index
    }
}

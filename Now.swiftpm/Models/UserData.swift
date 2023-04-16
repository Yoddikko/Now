//
//  UserData.swift
//  Now.
//
//  Created by Ale on 16/04/23.
//

import Foundation

class UserData : ObservableObject {
    var breathing: Int
    var journal: String
    
    init() {
        breathing = 0
        journal = ""
    }
    
    func setBreathing(time: Int) {
        if self.breathing == 0 {
            self.breathing = time
        } else {
            self.breathing += time
        }
    }
    
    func setJournal(text: String) {
        self.journal = text
    }
    
    func getJournal() -> String {
        return self.journal
    }
    
    func getBreathing() -> Int {
        return self.breathing
    }
}

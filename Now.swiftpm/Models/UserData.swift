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
    var quote: Quote?
    var lastQuote: Quote?
    var gratitude: [String]?
    
    init() {
        self.breathing = 0
        self.journal = ""
        self.quote = nil
    }
    
    func setBreathing(time: Int) {
        if self.breathing == 0 {
            self.breathing = time
        } else {
            self.breathing += time
        }
    }
    
    func setJournalText(text: String) {
        self.journal = text
    }
    
    func getJournalText() -> String {
        return self.journal
    }
    
    func getBreathingTime() -> Int {
        return self.breathing
    }
    
    func setGratitudeStrings(strings: [String]) {
        self.gratitude = []
        for string in strings {
            if !string.isEmpty {
                self.gratitude?.append(string)
            }
        }
    }
    
    func getGratitudeStrings() -> [String] {
        return self.gratitude ?? ["","",""]
    }
    
    func setQuote(quote: Quote) {
        self.quote = quote
    }
}



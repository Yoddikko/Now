//
//  QuoteView.swift
//  
//
//  Created by Ale on 15/04/23.
//

import SwiftUI

struct QuoteView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(sortDescriptors: [
        NSSortDescriptor(keyPath: \Quote.index, ascending: true)
    ], animation: .default)
    private var items: FetchedResults<Quote>
    
    var body: some View {
        ForEach (items) { quote in
            Text(quote.author ?? "") 
        }
    }
}

struct QuoeView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteView()
    }
}

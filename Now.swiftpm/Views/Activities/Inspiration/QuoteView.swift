//
//  QuoteView.swift
//  
//
//  Created by Ale on 15/04/23.
//

import SwiftUI

struct QuoteView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @EnvironmentObject var userData: UserData
    
    @FetchRequest(entity: Quote.entity(),  sortDescriptors: [])
    private var quotes: FetchedResults<Quote>
    
    @State var randomQuote: Quote? = nil
    @State var isFavorite: Bool = false
    
    @Binding var isPresented : Bool
    
    var body: some View {
        VStack {
            Text("Enlight.")
                .font(FontViewModel.shared.fontGentiumPlusTitle3)
            
            Text("The Stoics believed that the key to a good life was having a rational mind and virtuous character, rather than external circumstances or objects. They emphasized the importance of avoiding negative emotions and developing positive character traits, such as justice, courage, moderation, and wisdom. The ultimate goal for Stoics is to live consistently with nature and to be internally consistent in their beliefs and values. In recent years, many people have turned to Stoic ideas for guidance in how to live well.")
                .padding(.horizontal)
                .font(FontViewModel.shared.fontGentiumPlusBody)
                .fixedSize(horizontal: false, vertical: true)
                .padding(.bottom, 10)
            
            Divider()
            
            Text(randomQuote?.text ?? "")
                .font(FontViewModel.shared.fontGentiumPlusTitle4)
                .padding(.horizontal)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.5)
                .lineLimit(4)
                .fixedSize(horizontal: false, vertical: true)
            HStack {
                Text(randomQuote?.author ?? "")
                    .font(FontViewModel.shared.fontGentiumPlusTitle5)
                    .foregroundColor(.secondary)
                    .padding(.horizontal, 30)
            }
            
            Spacer()
            
            VStack (spacing: 10) {
                
                
                HStack {
                    Button {
                        getRandomQuote()
                    } label: {
                        Text("Enlight me")
                            .font(FontViewModel.shared.fontGentiumPlusTitle4)
                            .padding(.horizontal, 30)
                    }
                    .background(RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(.secondary.opacity(0.1))
                    )
                    
                    
                    Button {
                        DispatchQueue.main.async {
                            Persistence.shared.toggleQuoteFavorite(index: randomQuote?.index ?? 0, context: viewContext)
                            isFavorite.toggle()
                        }
                        
                    } label: {
                        if isFavorite == true {
                            Image(systemName: "heart.fill")
                                .font(FontViewModel.shared.fontGentiumPlusTitle4)
                                .padding(.vertical, 7)
                                .padding(.horizontal)
                        } else {
                            Image(systemName: "heart")
                                .font(FontViewModel.shared.fontGentiumPlusTitle4)
                                .padding(.vertical, 7)
                                .padding(.horizontal)
                            
                        }
                        
                        
                        
                    }
                    .background(RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(.secondary.opacity(0.1))
                    )
                }
                
                
                Button {
                    isPresented = false
                    SoundViewModel.shared.playCompletionSoundHarp1()
                    
                } label: {
                    ZStack {
                        
                        Text("I'm ready to go")
                            .font(FontViewModel.shared.fontGentiumPlusTitle4)
                            .padding(.horizontal, 40)
                        
                    }
                }
                .background(RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(.orange.opacity(0.2))
                )
            }.padding()
            
            
        }.onDisappear {
            print(isPresented)
            if isFavorite {
                userData.setQuote(quote: randomQuote!)
            }
            userData.lastQuote = randomQuote!
        }
        
        .onAppear{
            if userData.lastQuote != nil {
                randomQuote = userData.lastQuote
            } else {
                getRandomQuote()
            }
        }
        .onChange(of: randomQuote?.favorite) { favorite in
            if favorite == true {
                isFavorite = true
            } else {
                isFavorite = false
            }
        }
    }
    
    
    func getRandomQuote() {
        let filteredQuotes = quotes.filter { quote in
            quote.index != randomQuote?.index
        }
        withAnimation(.easeInOut) {
            randomQuote = filteredQuotes.randomElement()
        }
    }
}


struct QuoeView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteView(isPresented: .constant(true))
    }
}

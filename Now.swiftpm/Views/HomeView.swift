//
//  SwiftUIView.swift
//  
//
//  Created by Ale on 13/04/23.
//

import SwiftUI

struct HomeView: View {
    
    @State private var breathingViewisShowingModal = false
    @State private var quoteViewisShowingModal = false
    
    @State private var journalViewisShowingModal = false


    var body: some View {
        ZStack {
            createBackground()
                .navigationBarBackButtonHidden(true)
            
            Button {
                breathingViewisShowingModal = true
            } label: {
                Rectangle().frame(width: 50, height: 50)
                    .foregroundColor(.white)
            }.position(x: 100, y: 600)
            
            Button {
                quoteViewisShowingModal = true
            } label: {
                Rectangle().frame(width: 50, height: 50)
                    .foregroundColor(.white)
            }.position(x: 200, y: 600)
            
            Button {
                journalViewisShowingModal = true
            } label: {
                Rectangle().frame(width: 50, height: 50)
                    .foregroundColor(.white)
            }.position(x: 300, y: 600)







        }
        
        .sheet(isPresented: $breathingViewisShowingModal, content: {
            BreathingView(isPresented: self.$breathingViewisShowingModal)
        })
        
        .sheet(isPresented: $quoteViewisShowingModal, content: {
            QuoteView(isPresented: self.$quoteViewisShowingModal)
        })
        
        .sheet(isPresented: $journalViewisShowingModal, content: {
            JournalView(isPresented: self.$journalViewisShowingModal)
        })


    }
}

struct HomeView_Preview: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

@ViewBuilder
func createBackground() -> some View {
    ZStack {
        Image("night_sky")
            .resizable()

        Image("desert")
            .resizable()
    }.ignoresSafeArea()
}

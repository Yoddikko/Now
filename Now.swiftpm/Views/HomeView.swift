//
//  SwiftUIView.swift
//  
//
//  Created by Ale on 13/04/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            createBackground()
                .navigationBarBackButtonHidden(true)
            
            NavigationLink {
                BreathingView()
            } label: {
                Rectangle().frame(width: 50, height: 50).foregroundColor(.white)
    .position(x: 100, y: 600)

            }



        }
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

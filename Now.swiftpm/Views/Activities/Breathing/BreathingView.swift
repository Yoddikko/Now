//
//  BreathingView.swift
//  
//
//  Created by Ale on 14/04/23.
//

import SwiftUI

struct BreathingView: View {
    @State var infoViewToggle = false

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(.gray.opacity(0.8))
            
            VStack {
                HStack {
                    Text("Breathing exercise")
                        .font(FontViewModel.shared.fontGentiumPlusTitle3)
                }
                Text("LOREM IPSUM LOREM IPSUM LOREM IPSUM LOREM IPSUM LOREM IPSUM LOREM IPSUM LOREM IPSUM LOREM IPSUM LOREM IPSUM LOREM IPSUM LOREM IPSUM LOREM IPSUM LOREM IPSUM LOREM IPSUM LOREM IPSUM LOREM IPSUM LOREM IPSUM LOREM IPSUM LOREM IPSUM LOREM IPSUM LOREM IPSUM LOREM IPSUM LOREM IPSUM LOREM IPSUM LOREM IPSUM LOREM IPSUM")
                CircleBreathingView()
                BreathingTextsView()
                Spacer()
            }
        }.padding(50)
    }
}

struct BreathingView_Previews: PreviewProvider {
    static var previews: some View {
        BreathingView()
    }
}
